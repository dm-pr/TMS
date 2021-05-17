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

namespace TMS.Areas.Coordinator.Api
{
    /// <summary>
    /// This controller handles calls originating from JS (fetch) in cocalls.js. 
    /// </summary>
    [Area("Coordinator")]
    [Authorize(Roles = "Coordinator")]
    public class ApiController : ControllerBase
    {

        private readonly ITicketRepository _ticketRepository;        

        public ApiController(ITicketRepository ticketRepository)
        {
            _ticketRepository = ticketRepository;            
        }

        //Adds a ticket to the queue for later assigning to an Operator schedule
        //Post /Coordinator/api/api/addtoqueue/{id}
        [HttpPost]
        public ActionResult AddToQueue(int id)
        {
            if (id == 0) return BadRequest();

            var userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            Ticket ticket = _ticketRepository.GetTicket(id);
            if(ticket == null) return BadRequest();

            _ticketRepository.AddToQueue(userId, ticket);

            return Ok();
        }

        //Returns whole queue json formatted.
        //Get /Coordinator/api/api/getqueueasjson
        [HttpGet]
        public ActionResult GetQueueAsJson()
        {
            var userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            TicketQueue queue = _ticketRepository.GetTicketQueue(userId);

            return Ok(queue);
        }

        //Removes a ticket from the queue.
        //Delete /Coordinator/api/api/deletequeueitem/{id}
        [HttpDelete]
        public ActionResult DeleteQueueItem(int id)
        {
            if (id == 0) return BadRequest();

            var userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            Ticket ticket = _ticketRepository.GetTicket(id);
            if (ticket == null) return BadRequest();

            _ticketRepository.DeleteFromQueue(userId, ticket);

            return Ok();
        }

        //Returns json formatted report and coupled ticket for presenting
        //GET /Coordinator/api/api/getreport/{id}
        [HttpGet]
        public ActionResult GetReport(int id, [FromServices] IReportRepository reportRepository, [FromServices] IMapper mapper)
        {
            if (id == 0) return BadRequest();

            Report report = reportRepository.GetReport(id);
            if (report == null) return BadRequest();

            Ticket ticket = _ticketRepository.GetTicket(report.TicketId);

            return Ok(new { report = mapper.Map<ReportViewModel>(report), ticket = mapper.Map<TicketViewModel>(ticket) });            
        }


        //Marks a ticket as completed (  not closed !  )
        //PATCH /Coordinator/api/api/markcompledted/{id}
        [HttpPatch]
        public ActionResult MarkCompleted(int id)
        {
            if (id == 0) return BadRequest();

            Ticket ticket = _ticketRepository.GetTicket(id);
            if (ticket == null) return BadRequest();

            ticket.Completed = DateTime.Now;
            _ticketRepository.UpdateTicket(ticket);
            return Ok();
        }

        //Returns statistics for the chart
        //GET /Coordinator/api/api/getchartdata
        [HttpGet]
        public ActionResult GetChartData()
        {
            return Ok(_ticketRepository.GetStatistics());
        }

        //Validates inputs and confirms that a schedule item can be added into an Operator schedule based on different criteria
        //GET /Coordinator/api/api/canaddscheduleitem
        [HttpGet]
        public ActionResult CanAddScheduleItem(int operatorId, DateTime selectedDate, string startTime, string endTime, [FromServices] IOperatorRepository operatorRepository)
        {
            //begin with checks of submitted data
            DateTime requestedStart, requestedEnd;
            
            if(! DateTime.TryParse(selectedDate.ToString("yyyy-MM-dd") + $" {startTime}", out requestedStart))
                return BadRequest(new { result = "NOK", error = "badstarttime" });

            if(! DateTime.TryParse(selectedDate.ToString("yyyy-MM-dd") + $" {endTime}", out requestedEnd))
                return BadRequest(new { result = "NOK", error = "badendtime" });

            if(requestedStart >= requestedEnd)
                return BadRequest(new { result = "NOK", error = "badtime" });

            TimeSpan requestedSpan = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));

            if (requestedSpan.TotalHours > 8)
                return BadRequest(new { result = "NOK", error = "toomuch" });



            Models.Operator op = operatorRepository.GetOperator(operatorId);
            if (op == null)
                return BadRequest(new { result = "NOK", error = "badop" });

            OperatorSchedule schedule = operatorRepository.GetOperatorSchedule(op);

            var items = schedule.ScheduleItems.Where(si => si.StartTime.Date.Equals(selectedDate.Date));

            //no schedule items for this date,  go ahead with adding new.
            if (items.Count() == 0)
                return Ok(new { result = "OK" });
            
            TimeSpan existingSpan = new TimeSpan(0);

            foreach (ScheduleItem item in items)
            {
                //check for overlap
                if (item.StartTime < requestedEnd && requestedStart < item.EndTime) //  overlap !
                {
                    return BadRequest(new { result = "NOK", error = "overlap" });
                }
                existingSpan = existingSpan.Add(item.EndTime.Subtract(item.StartTime));
            }
            
            //check existingSpan which is composed of all time intervals for this day ,  to see if adding requested span will exceed 8 hours.
            if(existingSpan.Add(requestedSpan).TotalHours > 8)
                return BadRequest(new { result = "NOK", error = "toomuch" });

            return Ok(new { result = "OK" });
        }

    }
}
