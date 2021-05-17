using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace TMS.Models
{
    public class TMSUser : IdentityUser<int>
    {
        public string Name { get; set; }
    }
}
