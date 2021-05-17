using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.Models;

namespace TMS.ViewModels
{
    public class ScheduleItemViewModel
    {
        public int Id { get; set; }

        //Start and end time of this schedule item
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }

        //Created by 
        public string CoordinatorName { get; set; }

        //assigned ticket. Only one ticket per one Schedule item is allowed
        public TicketViewModel Ticket { get; set; }
    }
}
