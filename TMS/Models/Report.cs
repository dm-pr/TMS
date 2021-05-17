using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.Models
{
    public class Report
    {

        public int Id { get; set; }

        public DateTime Created { get; set; }        
        public DateTime? Modified { get; set; }

        //Navigation properties
        public int OperatorId { get; set; }
        public Operator Operator { get; set; }

        public int TicketId { get; set; }
        public Ticket Ticket { get; set; }

        //
        [Required]
        public string Title { get; set; }
        [Required]
        public string Body { get; set; }

    }
}
