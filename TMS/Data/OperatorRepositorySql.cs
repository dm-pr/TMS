using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using TMS.Models;

namespace TMS.Data
{
    /// <summary>
    /// SQL Server repository for working on Operators
    /// </summary>
    public class OperatorRepositorySql : IOperatorRepository
    {
        private readonly AppDbContext _context;

        public OperatorRepositorySql(AppDbContext context)
        {
            _context = context;
        }

        //Returns a list of all Operators
        public List<Operator> GetAllOperators()
        {
            return _context.TMSUsers.OfType<Operator>().ToList();
        }

        //Returns a single Operator or null if no such id
        public Operator GetOperator(int id)
        {
            return _context.TMSUsers.OfType<Operator>().FirstOrDefault(o => o.Id == id);            
        }

        //Returns Operators schedule.
        public OperatorSchedule GetOperatorSchedule(Operator op)
        {
            return _context.OperatorSchedules.Include(os => os.ScheduleItems).ThenInclude(t => t.Ticket).FirstOrDefault(os => os.OperatorId == op.Id);
        }

        //Adds a Schedule Item into an Operator schedule
        public void AddScheduleItem(int operatorId, ScheduleItem item)
        {
            OperatorSchedule opS = _context.OperatorSchedules.Include(os => os.ScheduleItems).FirstOrDefault(o => o.OperatorId == operatorId);
            opS.ScheduleItems.Add(item);
            _context.SaveChanges();
        }
    }
}
