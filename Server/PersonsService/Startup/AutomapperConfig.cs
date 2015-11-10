using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using StructureMap;

namespace PersonsService
{
    public class AutomapperConfig : Core.Startup.BootstrapperBase
    {
        public override void Configure(Container container)
        {
            Mapper.CreateMap<DataAccess.Client, PersonsServiceModel.Client>();
            Mapper.CreateMap<DataAccess.Employee, PersonsServiceModel.Employee>();
            Mapper.CreateMap<DataAccess.Branch, PersonsServiceModel.Branch>();
            Mapper.CreateMap<DataAccess.Team, PersonsServiceModel.Team>();
            Mapper.CreateMap<DataAccess.ClientNote, PersonsServiceModel.Note>()
                .ForMember(dest => dest.AuthorId, opt => opt.ResolveUsing(clientNote => clientNote.Client_Id))
                .ForMember(dest => dest.PersonType, opt => opt.UseValue(PersonsServiceModel.PersonType.Client));
            Mapper.CreateMap<DataAccess.EmployeeNote, PersonsServiceModel.Note>()
                .ForMember(dest => dest.AuthorId, opt => opt.ResolveUsing(clintNote => clintNote.Employee_Id))
                .ForMember(dest => dest.PersonType, opt => opt.UseValue(PersonsServiceModel.PersonType.Employee));
        }

    }
}