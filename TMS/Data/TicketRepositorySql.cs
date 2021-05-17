using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using TMS.Models;

namespace TMS.Data
{
    /// <summary>
    /// SQL Server repository for working on Tickets
    /// </summary>
    public class TicketRepositorySql : ITicketRepository
    {
        private readonly AppDbContext _context;

        public TicketRepositorySql(AppDbContext context)
        {
            _context = context;
        }

        //Ticket count total
        public int TicketCount
        {
            get => _context.Tickets.Count();
        }


        //Add custom ticket (only for Coordinators)
        public void AddTicket(Ticket ticket)
        {
            ticket.Created = DateTime.Now;
            _context.Tickets.Add(ticket);
            _context.SaveChanges();
        }

        //Return all tickets
        public IEnumerable<Ticket> GetAllTickets()
        {
            return _context.Tickets.ToList();
        }

        //Return a ticket
        public Ticket GetTicket(int id)
        {
            return _context.Tickets.FirstOrDefault(t => t.Id == id);
        }

        //Update a ticket
        public void UpdateTicket(Ticket ticket)
        {
            ticket.Modified = DateTime.Now;
            _context.Tickets.Update(ticket);
            _context.SaveChanges();
        }

        //Return number of possible pages give a set pageSize
        public int GetNumberOfPages(int pageSize)
        {
            var count = TicketCount;

            if (count < pageSize)
                return 1;

            return ((count % pageSize) == 0) ? count / pageSize : count / pageSize + 1;

        }

        //Return one page from first sorted and then paged list of tickets
        public IEnumerable<Ticket> GetSortedAndThenPagedTickets<T>(Func<Ticket, T> selector, bool sortAsc, int pageSize, int pageNumber)
        {
            if (sortAsc)
                return _context.Tickets.OrderBy(selector).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            else
                return _context.Tickets.OrderByDescending(selector).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
        }

        //Add a ticket to a a specified Coordinators  queue
        public void AddToQueue(int userId, Ticket ticket)
        {
            TicketQueue queue = _context.TicketQueues.Include(o => o.Queue).FirstOrDefault(t => t.CoordinatorId == userId);

            if (queue == null)
            {
                _context.TicketQueues.Add(new TicketQueue() { CoordinatorId = userId });
                _context.SaveChanges();
                queue = _context.TicketQueues.Include(o => o.Queue).FirstOrDefault(t => t.CoordinatorId == userId);
            }
            queue.Queue.Add(ticket);
            _context.SaveChanges();
        }

        //Return whole ticket queue for specified Coordinator
        public TicketQueue GetTicketQueue(int userId)
        {
            return _context.TicketQueues.Include(o => o.Queue).FirstOrDefault(t => t.CoordinatorId == userId);
        }

        //Remove ticket from a specified Coordinators queue
        public void DeleteFromQueue(int userId, Ticket ticket)
        {
            TicketQueue queue = _context.TicketQueues.Include(o => o.Queue).FirstOrDefault(t => t.CoordinatorId == userId);
            queue.Queue.Remove(ticket);
            _context.SaveChanges();
        }

        //Return statistics for the chart
        public SortedDictionary<string, int> GetStatistics()
        {
            SortedDictionary<string, int> result = new SortedDictionary<string, int>();

            var query = _context.Tickets.AsEnumerable().GroupBy(t => t.Created.Date).OrderBy(i => i.Key);

            foreach(var item in query)
            {
                result.Add(item.Key.ToString("yyyy-MM-dd"), item.Count());
            }

            return result;
        }
    }
}
