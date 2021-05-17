using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using TMS.Areas.Coordinator.ViewModels;
using TMS.Models;
using TMS.ViewModels;

namespace TMS.MappingProfiles
{
    //This is mapper profile for AutoMapper. Automapper picks this up automatically
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            //Source -> Target
            CreateMap<Ticket, TicketViewModel>();
            CreateMap<TicketViewModel, Ticket>();


            CreateMap<ScheduleItem, ScheduleItemViewModel>();
            CreateMap<ScheduleItemViewModel, ScheduleItem>();


            CreateMap<Report, ReportViewModel>();
            CreateMap<ReportViewModel, Report>();
        }
    }
}
