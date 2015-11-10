using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Core.Startup;
using DomainModel;
using StructureMap;

namespace SchedulingService.WcfClient.Startup
{
    public class AutomapperConfig : BootstrapperBase
    {
        public override void Configure(Container container)
        {
            Mapper.CreateMap<SchedulingServiceModel.Visit, Visit>();
            Mapper.CreateMap<SchedulingServiceModel.Employee, Employee>();
            Mapper.CreateMap<SchedulingServiceModel.Client, Client>();

            Mapper.CreateMap<SchedulingServiceModel.Branch, Branch>();
            Mapper.CreateMap<SchedulingServiceModel.Team, Team>();
        }
    }
}
