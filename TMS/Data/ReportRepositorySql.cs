using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using TMS.Models;

namespace TMS.Data
{
    /// <summary>
    /// SQL Server repository for working on Reports
    /// </summary>
    public class ReportRepositorySql : IReportRepository
    {

        private readonly AppDbContext _context;
        
        public ReportRepositorySql(AppDbContext context)
        {
            _context = context;
        }

        //Returns count of all reports or only for a given Operator
        public int ReportCount(int operatorId = 0)
        {
            if (operatorId == 0)
                return _context.Reports.Count();
            else
                return _context.Reports.Where(r => r.OperatorId == operatorId).Count();
        }

        //Adds a report
        public void AddReport(Report report)
        {
            report.Created = DateTime.Now;
            _context.Reports.Add(report);
            _context.SaveChanges();
        }

        //Updates a report
        public void UpdateReport(Report report)
        {
            report.Modified = DateTime.Now;
            _context.Reports.Update(report);
            _context.SaveChanges();
        }

        //Returns a list of reports,  all of them or only for a specified Operator
        public IEnumerable<Report> GetAllReports(int operatorId = 0)
        {
            if (operatorId == 0)
                return _context.Reports.ToList();
            else
                return _context.Reports.Where(r => r.OperatorId == operatorId).ToList();
        }

        //Returns number of possible pages given a set pageSize and an optional Operator ID. 
        public int GetNumberOfPages(int pageSize, int operatorId = 0)
        {
            int count = (operatorId == 0) ? ReportCount() : ReportCount(operatorId);

            if (count < pageSize)
                return 1;

            return ((count % pageSize) == 0) ? count / pageSize : count / pageSize + 1;
        }


        //Returns a report only by its Id or with operator Id to confirm ownership
        public Report GetReport(int id, int operatorId = 0)
        {
            if (operatorId == 0)
                return _context.Reports.FirstOrDefault(r => r.Id == id);
            else
                return _context.Reports.FirstOrDefault(r => (r.OperatorId == operatorId && r.Id == id));
        }

        //Returns report for a given ticket
        public Report GetReportForTicket(int ticketId)
        {
            return _context.Reports.FirstOrDefault(r => r.TicketId == ticketId);
        }
        
        //Checks if a ticket has a report
        public bool HasReport(int ticketId)
        {
            return _context.Reports.Any(r => r.TicketId == ticketId);
        }

        //Returns  one page of first sorted then paged list of reports. If operator ID is supplied, then only that Operators reports are handled
        public IEnumerable<Report> GetSortedAndThenPagedReports<T>(Func<Report, T> selector, bool sortAsc, int pageSize, int pageNumber, int operatorId = 0)
        {
            if (sortAsc)
            {
                if (operatorId == 0)
                    return _context.Reports.OrderBy(selector).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
                else
                    return _context.Reports.Where(r => r.OperatorId == operatorId).OrderBy(selector).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            }
            else
            {
                if(operatorId == 0)
                    return _context.Reports.OrderByDescending(selector).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
                else
                    return _context.Reports.Where(r => r.OperatorId == operatorId).OrderByDescending(selector).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            }
        }
    }
}
