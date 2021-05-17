using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.Models;

namespace TMS.ViewModels
{
    public class TicketViewModel
    {

        public int Id { get; set; }
        public string TicketTitle { get; set; }

        public string TicketBody { get; set; }
        public string AdditionalData { get; set; }

        
        public bool Assigned { get; set; }

        public DateTime Created { get; set; }
        public DateTime Modified { get; set; }
        public DateTime Closed { get; set; }

        public TicketUrgency Urgency { get; set; }

        public DateTime Completed { get; set; }


        //Not part of underlying Ticket Data model.
        public int OperatorReportId { get; set; }

    }
}
