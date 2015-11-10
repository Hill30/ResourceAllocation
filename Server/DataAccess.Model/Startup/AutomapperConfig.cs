using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using StructureMap;

namespace DataAccess.Model.Startup
{
    public class AutomapperConfig : Core.Startup.BootstrapperBase
    {
        public override void Configure(Container container)
        {
            Mapper.CreateMap<Process, DomainModel.Process>()
                .ForMember(dest => dest.Steps, opt => opt.ResolveUsing<StepsResolver>());
            Mapper.CreateMap<Reason, DomainModel.Reason>();
        }

        private class StepsResolver : ValueResolver<Process, List<DomainModel.ProcessStep>>
        {
            protected override List<DomainModel.ProcessStep> ResolveCore(Process source)
            {
                if (source.ProcessSteps == null)
                    return null;

                return source.ProcessSteps
                    .Select(stepDescription => DomainModel.ProcessStep.Create(stepDescription.Step.Type, stepDescription.Mandatory, stepDescription.Params))
                    .ToList();
            }
        }
    }
}