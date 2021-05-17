using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.Models
{
    //Operator schedule class. Is owned by Operator.  Owns ScheduleItems.
    public class OperatorSchedule
    {
        public int Id { get; set; }

        //One to One relation to its Operator
        //An Operator Schedule must be created when a new Operator is registered. For the purpose of this Demo with manually seeded Operator users, I will create OperatorSchedule manually too.
        public int OperatorId { get; set; }
        public Operator Operator { get; set; }

        public List<ScheduleItem> ScheduleItems { get; set; }        
    }
}
