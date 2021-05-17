using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.ViewModels;

namespace TMS.Areas.Operator.ViewModels
{
    public class OperatorReportsViewModel
    {
        //Sorting/paging properties
        public int NumberOfPages { get; set; }
        public int CurrentPage { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public bool sortAsc { get; set; } = false;
        public string sortColumn { get; set; } = "Id";
                
        //Items (rows) for the report table
        public List<ReportViewModel> ReportTableItems { get; set; }
        
        //Route data
        public Dictionary<string, string> RouteData { get; set; }
    }
}
