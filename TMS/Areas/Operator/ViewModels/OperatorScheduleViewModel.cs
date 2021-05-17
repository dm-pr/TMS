using System;
using System.Collections.Generic;
using TMS.ViewModels;

namespace TMS.Areas.Operator.ViewModels
{
    public class OperatorScheduleViewModel
    {
        //Current schedule date
        public DateTime SelectedDate { get; set; }

        //List of available ScheduleItems for this Operator 
        public List<ScheduleItemViewModel> ScheduleItems { get; set; } = new List<ScheduleItemViewModel>();

        //Table rows of tickets that require attention table.
        public Dictionary<DateTime, string[]> TodoRows { get; set; } = new Dictionary<DateTime, string[]>();
    }
}
