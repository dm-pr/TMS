using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.Models;

namespace TMS.Data
{    
    public interface ITicketRepository
    {
        public int TicketCount { get; }

        public IEnumerable<Ticket> GetAllTickets();

        public Ticket GetTicket(int id);

        public void AddTicket(Ticket ticket);

        public void UpdateTicket(Ticket ticket);

        public int GetNumberOfPages(int pageSize);
        
        public IEnumerable<Ticket> GetSortedAndThenPagedTickets<T>(Func<Ticket, T> selector, bool sortAsc, int pageSize, int pageNumber);

        public void AddToQueue(int userId, Ticket ticket);

        public TicketQueue GetTicketQueue(int userId);

        public void DeleteFromQueue(int userId, Ticket ticket);

        public SortedDictionary<string, int> GetStatistics();
    }
}
