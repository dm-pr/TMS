using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.ViewModels
{

    public class ReportViewModel
    {

        public int Id { get; set; }

        public DateTime Created { get; set; }
        public DateTime Modified { get; set; }

        //Operator that created this report
        public int OperatorId { get; set; }
        
        //Ticket to which this report is attached
        public int TicketId { get; set; }

        public string Title { get; set; }
        public string Body { get; set; }

    }
}
