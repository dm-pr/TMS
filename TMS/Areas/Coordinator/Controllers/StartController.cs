using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Infrastructure;
using Microsoft.AspNetCore.Authorization.Policy;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TMS.Areas.Coordinator.ViewModels;
using TMS.ViewModels;
using TMS.Data;
using TMS.Models;

namespace TMS.Areas.Coordinator.Controllers
{
    /// <summary>
    /// This controller is start (Home) controller for the Coordinator Area. 
    /// It handles table view for all tickets, sorting/paging and closing tickets.
    /// </summary>
    [Area("Coordinator")]
    [Authorize(Roles ="Coordinator")]     
    public class StartController : Controller
    {

        private readonly ITicketRepository _ticketRepository;

        public StartController(ITicketRepository ticketRepository)
        {
            _ticketRepository = ticketRepository;
        }

        //TicketTableModel has default values set in the class, so if model is not filled in start controller (first run) those values will be used
        [HttpGet]
        public IActionResult Start(TicketTableBody tableToView, [FromServices] IMapper mapper, [FromServices] IReportRepository reportRepository)
        {

            //first, set number of pages
            tableToView.NumberOfPages = _ticketRepository.GetNumberOfPages(tableToView.PageSize);

            List<TicketViewModel> tList = new List<TicketViewModel>();
            IEnumerable<Ticket> result;

            //then see if sorting is set on a specific column.
            if (string.IsNullOrEmpty(tableToView.sortColumn) || tableToView.sortColumn.Trim().ToLower() == "id")  //sort on Id
                result = _ticketRepository.GetSortedAndThenPagedTickets(s => s.Id, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);
            else
            {
                switch (tableToView.sortColumn.Trim().ToLower())
                {
                    case "title":
                        result = _ticketRepository.GetSortedAndThenPagedTickets(s => s.TicketTitle, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);                       
                        break;
                    case "created":
                        result = _ticketRepository.GetSortedAndThenPagedTickets(s => s.Created, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);
                        break;
                    case "urgency":
                        result = _ticketRepository.GetSortedAndThenPagedTickets(s => s.Urgency, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);
                        break;
                    case "assigned":
                        result = _ticketRepository.GetSortedAndThenPagedTickets(s => s.Assigned, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);
                        break;
                    case "completed":
                        result = _ticketRepository.GetSortedAndThenPagedTickets(s => s.Completed, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);
                        break;

                    default:
                        result = _ticketRepository.GetSortedAndThenPagedTickets(s => s.Id, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);
                        break;
                }
            }

            //Map Tickets in result into Viewmodel
            foreach (var item in result)
            {
                TicketViewModel model = mapper.Map<TicketViewModel>(item);
                Report report = reportRepository.GetReportForTicket(item.Id);
                model.OperatorReportId = report != null ? report.Id : 0;
                tList.Add(model);
            }

            //Add Route parameters for Query string URLs for sorting and such
            //Parameters that are in Model.xxx for all-route-data tag helper will be overwritten if the same html-tag
            //defines new value for that parameter in asp-route-xxx  tag helper
            var dict = RouteData.Values.ToDictionary(k => k.Key, k => k.Value.ToString());
            dict.Add("pagesize", tableToView.PageSize.ToString());
            dict.Add("sortasc", tableToView.sortAsc.ToString());
            dict.Add("sortcolumn", tableToView.sortColumn);
            dict.Add("currentpage", tableToView.CurrentPage.ToString());
          
            tableToView.TicketTableItems = tList;
            tableToView.RouteData = dict;


            return View(tableToView);
        }



        [HttpPost]
        public IActionResult CloseTicket(int id)
        {
            Ticket ticket = _ticketRepository.GetTicket(id);
            ticket.Closed = DateTime.Now;
            _ticketRepository.UpdateTicket(ticket);

            return RedirectToAction("start", "start");
        }

        public IActionResult Logout()
        {
            return RedirectToAction("performlogout", "login", new { area = "" });
        }
    }
}
