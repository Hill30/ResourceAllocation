using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using DomainModel.Common;
using MessagingModel;
using StructureMap;

namespace DomainModel.Startup
{
    public class AutomapperConfig : Core.Startup.BootstrapperBase
    {
        public override void Configure(Container container)
        {
            Mapper.CreateMap<ProcessCompleteData, CallOffEvent>()
                .ForMember(dest => dest.CaregiverId, opt => opt.MapFrom(src => src.PersonId))
                .ForMember(dest => dest.VisitIds, opt => opt.ResolveUsing<VisitIdsResolver>());
            Mapper.CreateMap<ProcessCompleteData, ChangeInConditionEvent>()
                .ForMember(dest => dest.CaregiverId, opt => opt.MapFrom(src => src.PersonId))
                .ForMember(dest => dest.VisitId, opt => opt.ResolveUsing<SingleVisitIdResolver>());
        }

        private class VisitIdsResolver : ValueResolver<ProcessCompleteData, List<int>>
        {
            protected override List<int> ResolveCore(ProcessCompleteData source)
            {
                if (source.ProcessPayload == null || source.ProcessPayload.Visits == null)
                    return new List<int>();

                return new List<int>(source.ProcessPayload.Visits);
            }
        }

        private class SingleVisitIdResolver : ValueResolver<ProcessCompleteData, int>
        {
            protected override int ResolveCore(ProcessCompleteData source)
            {
                if (source.ProcessPayload == null || source.ProcessPayload.Visits == null || source.ProcessPayload.Visits.Count == 0)
                    return -1;

                return source.ProcessPayload.Visits.First();
            }
        }
    }
}