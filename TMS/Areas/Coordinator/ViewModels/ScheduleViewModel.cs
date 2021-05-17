using System;
using System.Collections.Generic;
using TMS.ViewModels;

namespace TMS.Areas.Coordinator.ViewModels
{
    public class ScheduleViewModel
    {
        //available Operators
        public Dictionary<string, int> Operators { get; set; }

        //Current Operator
        public (string Operator, int Id) CurrentOperator { get; set; }

        //Current schedule date
        public DateTime SelectedDate { get; set; }

        //List of available ScheduleItems for this Operator and date
        public List<ScheduleItemViewModel> ScheduleItems { get; set; } = new List<ScheduleItemViewModel>();

    }
}
