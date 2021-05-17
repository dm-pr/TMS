using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.Models;

namespace TMS.Data
{
    public class AppDbContext: IdentityDbContext<TMSUser, TMSRole, int>
    {
        public AppDbContext(DbContextOptions<AppDbContext> opts) : base (opts)
        {
        }
      

        public DbSet<TMSUser> TMSUsers { get; set; }
        public DbSet<OperatorSchedule> OperatorSchedules { get; set; }
        public DbSet<Ticket> Tickets { get; set; }
        public DbSet<TicketQueue> TicketQueues { get; set; }
        public DbSet<Report> Reports { get; set; }

        //I chose to go convention route and let EF Core create relationships automatically based on navigation properties
        //So here I only configure Table-Per-Hierarchy for users, so that I can use Identity user table to store both Coordinators and Operators.
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            //TPH setup
            builder.Entity<Coordinator>();
            builder.Entity<Operator>();
            
        }
    }
}
