using System;
using System.Collections.Generic;
using TMS.ViewModels;

namespace TMS.Areas.Coordinator.ViewModels
{
    //Viewmodel for Coordinators Start page
    public class TicketTableBody
    {
        //Sorting and paging properties
        public int NumberOfPages { get; set; }
        public int CurrentPage { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public bool sortAsc { get; set; } = false;
        public string sortColumn { get; set; } = "Id";

        //List of rows 
        public List<TicketViewModel> TicketTableItems { get; set; }

        //Route data
        public Dictionary<string, string> RouteData { get; set; }
    }
}
