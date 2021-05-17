using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.Models
{
    public class ScheduleItem
    {
        public int Id { get; set; }

        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }

        //Created by 
        public string CoordinatorName { get; set; }


        //Relation to Operator Schedule.
        public int OperatorScheduleId { get; set; }
        public OperatorSchedule OperatorSchedule { get; set; }

        //One Schedule Item contains only one Ticket
        public int TicketId { get; set; }
        public Ticket Ticket { get; set; }
    }
}
