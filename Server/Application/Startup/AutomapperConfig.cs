using System;
using Application.Common;
using AutoMapper;
using DomainModel;
using StructureMap;

namespace Application.Startup
{
    public class AutomapperConfig : Core.Startup.BootstrapperBase
    {
        public override void Configure(Container container)
        {
            Mapper.CreateMap<Process, Models.Process>()
                .ForMember(dest => dest.CallType, opt => opt.ResolveUsing<CallTypeResolver>())
                .ForMember(dest => dest.CallerType, opt => opt.ResolveUsing<CallerTypeResolver>());

            Mapper.CreateMap<Person, Models.Person>()
                .Include<Employee, Models.Employee>()
                .Include<Client, Models.Client>()
                .ForMember(dest => dest.Type, opt => opt.ResolveUsing<PersonTypeResolver>())
                .ForMember(dest => dest.Name, opt => opt.ResolveUsing<PersonNameResolver>())
                .ForMember(dest => dest.Location, opt => opt.ResolveUsing<PersonLocationResolver>());
            Mapper.CreateMap<Employee, Models.Employee>();
            Mapper.CreateMap<Client, Models.Client>();

            Mapper.CreateMap<Branch, Models.Branch>();
            Mapper.CreateMap<Team, Models.Team>();

            Mapper.CreateMap<Visit, Models.Visit>()
                .ForMember(dest => dest.ClientName, opt => opt.ResolveUsing<VisitClientNameResolver>())
                .ForMember(dest => dest.EmployeeName, opt => opt.ResolveUsing<VisitEmployeeNameResolver>());

            Mapper.CreateMap<Note, Models.Note>()
                .ForMember(dest => dest.AuthorType, opt => opt.ResolveUsing<AuthorTypeResolver>());

            Mapper.CreateMap<Models.ProcessCompleteData, ProcessCompleteData>()
                .ForMember(dest => dest.PersonType, opt => opt.ResolveUsing<CompleteProcessPersonTypeResolver>());
            Mapper.CreateMap<Models.ProcessCompletePayloadData, ProcessCompletePayloadData>();
        }

        private class CallTypeResolver : ValueResolver<Process, string>
        {
            protected override string ResolveCore(Process source)
            {
                return Helper.CallTypeToString(source.CallType);
            }
        }

        private class CallerTypeResolver : ValueResolver<Process, string>
        {
            protected override string ResolveCore(Process source)
            {
                return Helper.CallerTypeToString(source.CallerType);
            }
        }

        private class PersonNameResolver : ValueResolver<Person, string>
        {
            protected override string ResolveCore(Person source)
            {
                return DomainModel.Common.Helper.GetPersonName(source);
            }
        }

        private class PersonTypeResolver : ValueResolver<Person, string>
        {
            protected override string ResolveCore(Person source)
            {
                return Helper.PersonTypeToString(source.PersonType);
            }
        }

        private class CompleteProcessPersonTypeResolver : ValueResolver<Models.ProcessCompleteData, PersonType>
        {
            protected override PersonType ResolveCore(Models.ProcessCompleteData source)
            {
                return Helper.GetPersonType(source.PersonType);
            }
        }
        
        private class PersonLocationResolver : ValueResolver<Person, string>
        {
            protected override string ResolveCore(Person source)
            {
                return source.Branch != null ? source.Branch.Name : null;
            }
        }

        private class VisitClientNameResolver : ValueResolver<Visit, string>
        {
            protected override string ResolveCore(Visit source)
            {
                return DomainModel.Common.Helper.GetPersonName(source.Client);
            }
        }

        private class VisitEmployeeNameResolver : ValueResolver<Visit, string>
        {
            protected override string ResolveCore(Visit source)
            {
                return DomainModel.Common.Helper.GetPersonName(source.Employee);
            }
        }

        private class AuthorTypeResolver : ValueResolver<Note, string>
        {
            protected override string ResolveCore(Note source)
            {
                return Helper.PersonTypeToString(source.PersonType);
            }
        }
    }
}