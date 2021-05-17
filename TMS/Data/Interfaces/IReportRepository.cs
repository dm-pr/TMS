using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.Models;

namespace TMS.Data
{
    public interface IReportRepository
    {
        public int ReportCount(int operatorId = 0);

        public IEnumerable<Report> GetAllReports(int operatorId = 0);

        public Report GetReport(int id, int operatorId = 0);

        public Report GetReportForTicket(int ticketId);

        public bool HasReport(int ticketId);

        public void AddReport(Report report);

        public void UpdateReport(Report report);

        public int GetNumberOfPages(int pageSize, int operatorId = 0);
        
        public IEnumerable<Report> GetSortedAndThenPagedReports<T>(Func<Report, T> selector, bool sortAsc, int pageSize, int pageNumber, int operatorId = 0);

    }
}
