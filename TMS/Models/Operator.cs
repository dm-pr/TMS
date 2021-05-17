using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.Models
{
    //Operator user class. External is not used yet. 
    public class Operator : TMSUser
    {        
        public bool External { get; set; }

        //Owns.  Navigation property
        public OperatorSchedule operatorSchedule { get; set; } 
    }
}
