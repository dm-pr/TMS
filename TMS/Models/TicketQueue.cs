using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.Models
{
    public class TicketQueue
    {
        public int Id { get; set; }
     
        //Navigation properties
        public int CoordinatorId { get; set; }
        public Coordinator Coordinator { get; set; }

        public List<Ticket> Queue { get; set; }
    }
}
