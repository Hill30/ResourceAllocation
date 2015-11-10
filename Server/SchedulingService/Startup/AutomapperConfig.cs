using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using StructureMap;

namespace SchedulingService.Startup
{
    public class AutomapperConfig : Core.Startup.BootstrapperBase
    {

        public override void Configure(Container container)
        {
            Mapper.CreateMap<DataAccess.Client, SchedulingServiceModel.Client>();
            Mapper.CreateMap<DataAccess.Employee, SchedulingServiceModel.Employee>();
            Mapper.CreateMap<DataAccess.Branch, SchedulingServiceModel.Branch>();
            Mapper.CreateMap<DataAccess.Team, SchedulingServiceModel.Team>();

            Mapper.CreateMap<DataAccess.Schedule, SchedulingServiceModel.Visit>()
                .ForMember(dest => dest.EndTime, opt => opt.MapFrom(src => src.StartDate.Add(src.EndTime)))
                .ForMember(dest => dest.StartTime, opt => opt.MapFrom(src => src.StartDate.Add(src.StartTime)))
                ;
        }


    }
}