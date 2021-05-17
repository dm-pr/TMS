using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TMS.Data;
using TMS.Models;
using Xunit;

namespace TMS.Tests
{
    public class EFCoreTests
    {
         [Fact]        
         public void TicketRepository_CanReturnTickets()
        {

            using (var context = GetDbContext())
            {
                var repo = new TicketRepositorySql(context);

                IEnumerable<Ticket> result = repo.GetAllTickets();

                Assert.All(result, item =>
               {
                   Assert.True(item.Id > 0);
               });
            }            
        }

        [Fact]
        public void TicketRepository_CanReturnPagedAndSorted()
        {
            using (var context = GetDbContext())
            {
                var repo = new TicketRepositorySql(context);

                var ticket = new Ticket();

                var result = repo.GetSortedAndThenPagedTickets(t => t.TicketTitle, true, 10, 3);

                Assert.IsAssignableFrom<IEnumerable<Ticket>>(result);
                
                
            }
        }



        private AppDbContext GetDbContext()
        {

            DbContextOptionsBuilder<AppDbContext> b = new DbContextOptionsBuilder<AppDbContext>();
            var opt = b.UseSqlServer("Data Source=localhost;Initial Catalog=tsm;Integrated Security=True").Options;

            return new AppDbContext(opt);
        }
    }
}
