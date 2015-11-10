using AutoMapper;
using Core.Startup;
using PersonsServiceModel;
using StructureMap;

namespace PersonsService.WcfClient.Startup
{
    public class AutomapperConfig: BootstrapperBase
    {
        public override void Configure(Container container)
        {
            Mapper.CreateMap<Person, DomainModel.Person>()
               .Include<Employee, DomainModel.Employee>()
               .Include<Client, DomainModel.Client>();

            Mapper.CreateMap<Employee, DomainModel.Employee>();
            Mapper.CreateMap<Client, DomainModel.Client>();

            Mapper.CreateMap<Branch, DomainModel.Branch>();
            Mapper.CreateMap<Team, DomainModel.Team>();
            Mapper.CreateMap<Note, DomainModel.Note>();
        }
    }
}
