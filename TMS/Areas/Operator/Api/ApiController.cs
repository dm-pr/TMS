using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TMS.Data;
using TMS.Models;
using TMS.ViewModels;

namespace TMS.Areas.Operator.Api
{
    /// <summary>
    /// This controller handles calls originating from JS (fetch) in opcalls.js. 
    /// </summary>
    [Area("Operator")]
    [Authorize(Roles = "Operator")]    
    public class ApiController : ControllerBase
    {
        private readonly IOperatorRepository _operatorRepository;
        private readonly IReportRepository _reportRepository;


        public ApiController(IOperatorRepository operatorRepo, IReportRepository reportRepo)
        {
            _operatorRepository = operatorRepo;
            _reportRepository = reportRepo;
        }             

        //Returns a list of active tickets that do not yet have a report attached
        //GET /operator/api/api/getactiveticketlist
        [HttpGet]
        public ActionResult GetActiveTicketList()
        {
            int userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            Models.Operator o = _operatorRepository.GetOperator(userId);            

            OperatorSchedule schedule = _operatorRepository.GetOperatorSchedule(o);

            List<Ticket> activeTicket = new List<Ticket>();
            foreach(ScheduleItem item in schedule.ScheduleItems)
            {
                if (!_reportRepository.HasReport(item.Ticket.Id))
                        activeTicket.Add(item.Ticket);
            }

            return Ok(new { operatorId = userId, data = activeTicket });
        }

        //Returns report with a specified id
        //GET /Operator/Api/Api/getreport/{id}
        [HttpGet]
        public ActionResult GetReport(int id, [FromServices] IMapper mapper, [FromServices] ITicketRepository ticketRepository)
        {
            if (id == 0) return NoContent();

            int userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            Report report = _reportRepository.GetReport(id, userId);

            if (report == null) return NoContent();

            Ticket ticket = ticketRepository.GetTicket(report.TicketId);

            return Ok(new { report = mapper.Map<ReportViewModel>(report), ticket = mapper.Map<TicketViewModel>(ticket) });
        }
    }
}
