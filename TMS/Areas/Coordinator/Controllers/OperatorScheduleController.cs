using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using TMS.Areas.Coordinator.ViewModels;
using TMS.ViewModels;
using TMS.Data;
using TMS.Models;
using System.Diagnostics;

namespace TMS.Areas.Coordinator.Controllers
{
    /// <summary>
    /// This controller handles viewing Operator schedules and adding tickets to 
    /// an Operator schedule using ScheduleItem model for additional schedule data.
    /// </summary>
    [Area("Coordinator")]
    [Authorize(Roles = "Coordinator")]

    public class OperatorScheduleController : Controller
    {

        private readonly IOperatorRepository _operatorRepository;

        public OperatorScheduleController(IOperatorRepository repo)
        {            
            _operatorRepository = repo;
        }

        [HttpGet]
        public IActionResult Start([FromServices] IMapper mapper, int op = 0, string inputDate = "")
        {
            ScheduleViewModel m = new ScheduleViewModel();

            m.SelectedDate = (string.IsNullOrEmpty(inputDate)) ? DateTime.Now
                : ((DateTime.TryParse(inputDate, out DateTime t)) ? t : DateTime.Now);


            m.Operators = _operatorRepository.GetAllOperators().ToDictionary(o => o.UserName, o => o.Id);

            if(op == 0)
            {
                KeyValuePair<string, int> vP =  m.Operators.OrderBy(c => c.Value).First();
                m.CurrentOperator = (vP.Key, vP.Value);
            }
            else
            {
                KeyValuePair<string, int> vP = m.Operators.Where(o => o.Value == op).First();
                m.CurrentOperator = (vP.Key, vP.Value);
            }

            //here we have bare model with operator and date set. Get schedule items to populate with           
            OperatorSchedule schedule = _operatorRepository.GetOperatorSchedule(_operatorRepository.GetOperator(m.CurrentOperator.Id));

            foreach(ScheduleItem item in schedule.ScheduleItems.Where(s => s.StartTime.Date.Equals(m.SelectedDate.Date)))
            {//Mapping ScheduleItem to ScheduleItemViewModel also takes care (via nested mapping) of mapping Ticket inside ScheduleItem into TicketViewModel inside ScheduleItemViewModel
                m.ScheduleItems.Add(mapper.Map<ScheduleItemViewModel>(item)); 
            }

            return View(m);
        }

        

        [HttpPost]
        public IActionResult AddScheduleItem(int op, string selectedDate, string startTime, string endTime, int ticketId, [FromServices] ITicketRepository ticketRepository)
        {

            int userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            string userName = User.Identity.Name;

            Models.Operator o = _operatorRepository.GetOperator(op);

            OperatorSchedule schedule = _operatorRepository.GetOperatorSchedule(o);

            ScheduleItem si = new ScheduleItem()
            {
                CoordinatorName = userName,
                StartTime = DateTime.Parse($"{selectedDate} {startTime}"),
                EndTime = DateTime.Parse($"{selectedDate} {endTime}"),
                OperatorScheduleId = schedule.Id,
                TicketId = ticketId
            };

            _operatorRepository.AddScheduleItem(o.Id, si);

            //remove from Queue as added and update assigned status
            Ticket ticket = ticketRepository.GetTicket(ticketId);
            ticket.Assigned = true;

            ticketRepository.DeleteFromQueue(userId, ticket);
            ticketRepository.UpdateTicket(ticket);

            
            return RedirectToAction("Start", new { op = op, inputDate= selectedDate });
        }

    }
}
