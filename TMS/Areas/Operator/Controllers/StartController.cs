using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TMS.Areas.Operator.ViewModels;
using TMS.Data;
using TMS.Models;
using TMS.ViewModels;

namespace TMS.Areas.Operator.Controllers
{
    /// <summary>
    /// This is a start (Home)  controller for Operator Area. This controller shows tickets that require attention
    /// and Operator schedule.
    /// </summary>
    [Area("Operator")]
    [Authorize(Roles = "Operator")]
    public class StartController : Controller
    {
        IOperatorRepository _operatorRepository;

        public StartController(IOperatorRepository repo)
        {
            _operatorRepository = repo;
        }


        //Start action - shows ticket queue and schedule
        [HttpGet]
        public IActionResult Start([FromServices] IMapper mapper,  string inputDate = "")
        {
            OperatorScheduleViewModel m = new OperatorScheduleViewModel();

            m.SelectedDate = (string.IsNullOrEmpty(inputDate)) ? DateTime.Now 
                : ((DateTime.TryParse(inputDate, out DateTime t)) ? t : DateTime.Now);


            int userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            Models.Operator o = _operatorRepository.GetOperator(userId);
            OperatorSchedule schedule = _operatorRepository.GetOperatorSchedule(o);
            

            var dateGroups = schedule.ScheduleItems.GroupBy(i => i.StartTime.Date).OrderBy(g => g.Key);

            //Grouping schedule items by date, iterate through groups.
            //ToDo rows are tickets that require attention, theese are active and not closed.
            foreach (var group in dateGroups)
            {                
                List<string> urgencies = new List<string>();

                foreach (ScheduleItem item in group)
                {
                    if (item.StartTime.Date.Equals(m.SelectedDate.Date))
                        m.ScheduleItems.Add(mapper.Map<ScheduleItemViewModel>(item));//Mapping ScheduleItem to ScheduleItemViewModel also nested mapping Ticket inside ScheduleItem into TicketViewModel inside ScheduleItemViewModel
                    
                    if(item.Ticket.Closed == DateTime.MinValue)// in todo rows  present tickets that are not closed.
                        urgencies.Add(item.Ticket.Urgency.ToString());
                }

                if (urgencies.Count != 0)
                    m.TodoRows.Add(group.Key, urgencies.ToArray());                
            }           

            return View(m);
        }

        
        public IActionResult Logout()
        {
            return RedirectToAction("performlogout", "login", new { area = "" });
        }
    }
}
