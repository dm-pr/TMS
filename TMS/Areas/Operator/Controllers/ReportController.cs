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
    /// This controller handles Operator reports. Viewing/sorting/paging  and creating new ones.
    /// </summary>
    [Area("Operator")]
    [Authorize(Roles = "Operator")]
    public class ReportController : Controller
    {

        private readonly IReportRepository _reportRepository;
        private readonly IMapper _mapper;

        public ReportController(IReportRepository repo, IMapper mapper)
        {
            _reportRepository = repo;
            _mapper = mapper;
        }


        //OperatorReportsViewModel has default values set in the class, so if model is not filled in start controller(first run) those v alues will be used
        [HttpGet]
        public IActionResult Start(OperatorReportsViewModel tableToView)
        {
            //Current Operator user id.
            int userId = int.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            //first, set number of pages
            tableToView.NumberOfPages = _reportRepository.GetNumberOfPages(tableToView.PageSize);

            List<ReportViewModel> tList = new List<ReportViewModel>();
            IEnumerable<Report> result;

            //then see if sorting is set on a specific column.
            if (string.IsNullOrEmpty(tableToView.sortColumn) || tableToView.sortColumn.Trim().ToLower() == "id")  //sort on Id
                result = _reportRepository.GetSortedAndThenPagedReports(r => r.Id, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage);
            else
            {
                switch (tableToView.sortColumn.Trim().ToLower())
                {
                    case "ticketid":
                        result = _reportRepository.GetSortedAndThenPagedReports(r => r.TicketId, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage, userId);
                        break;

                    case "title":
                        result = _reportRepository.GetSortedAndThenPagedReports(r => r.Title, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage, userId);
                        break;

                    case "created":
                        result = _reportRepository.GetSortedAndThenPagedReports(r => r.Created, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage, userId);
                        break;                 
                    
                    default:
                        result = _reportRepository.GetSortedAndThenPagedReports(r => r.Id, tableToView.sortAsc, tableToView.PageSize, tableToView.CurrentPage, userId);
                        break;
                }
            }

            //Map Reports in result into Viewmodel
            foreach (var item in result)
            {
                tList.Add(_mapper.Map<ReportViewModel>(item));
            }

         
            //Add Route parameters for Query string URLs for sorting and such
            //Parameters that are in Model.xxx for all-route-data tag helper will be overwritten if the same html-tag
            //defines new value for that parameter in asp-route-xxx  tag helper
            var dict = RouteData.Values.ToDictionary(k => k.Key, k => k.Value.ToString());
            dict.Add("pagesize", tableToView.PageSize.ToString());
            dict.Add("sortasc", tableToView.sortAsc.ToString());
            dict.Add("sortcolumn", tableToView.sortColumn);
            dict.Add("currentpage", tableToView.CurrentPage.ToString());


            tableToView.ReportTableItems = tList;
            tableToView.RouteData = dict;

            return View(tableToView);
        }


        //Creates new report
        [HttpPost]
        public IActionResult CreateNew(ReportViewModel model)
        {

            if (!ModelState.IsValid)            
                ModelState.AddModelError("reporterror", "No report was created");            
            else
                _reportRepository.AddReport(_mapper.Map<Report>(model));
            
            return RedirectToAction("start", "report");
        }




    }
}
