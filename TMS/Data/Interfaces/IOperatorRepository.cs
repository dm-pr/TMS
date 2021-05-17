using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.Models;

namespace TMS.Data
{
    public interface IOperatorRepository
    {
        public List<Operator> GetAllOperators();

        public Operator GetOperator(int id);

        public OperatorSchedule GetOperatorSchedule(Operator op);

        public void AddScheduleItem(int operatorId, ScheduleItem item);
    }
}
