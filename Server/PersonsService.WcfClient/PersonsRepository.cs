using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using DomainModel.Services;
using PersonsServiceModel;
using Client = DomainModel.Client;
using Employee = DomainModel.Employee;
using Note = DomainModel.Note;
using Person = DomainModel.Person;
using PersonType = DomainModel.PersonType;

namespace PersonsService.WcfClient
{
    public class PersonsRepository : IPersonsRepository
    {
        private readonly string _serviceUrl;

        public PersonsRepository(string _serviceUrl)
        {
            this._serviceUrl = _serviceUrl;
        }

        public List<Person> Search(string searchPattern, int count, int offset, string sortBy, ListSortDirection sortDirection)
        {
            using (var channelFactory = new WebChannelFactory<IPersonsService>(new Uri(_serviceUrl)))
            {
                var channel = channelFactory.CreateChannel();
                var result = channel.Search(searchPattern, count, offset, sortBy, sortDirection == ListSortDirection.Descending ? "desc" : "asc");
                return Mapper.Map<List<Person>>(result);
            }
        }

        public Employee GetEmployee(int id)
        {
            using (var channelFactory = new WebChannelFactory<IPersonsService>(new Uri(_serviceUrl)))
            {
                var channel = channelFactory.CreateChannel();
                var result = channel.GetEmployee(id);
                return Mapper.Map<Employee>(result);
            }
        }

        public Client GetClient(int id)
        {
            using (var channelFactory = new WebChannelFactory<IPersonsService>(new Uri(_serviceUrl)))
            {
                var channel = channelFactory.CreateChannel();
                var result = channel.GetClient(id);
                return Mapper.Map<Client>(result);
            }
        }

        public List<Note> GetPersonNotes(int personId, PersonType personType, int count, int offset, ListSortDirection sortDirection)
        {
            using (var channelFactory = new WebChannelFactory<IPersonsService>(new Uri(_serviceUrl)))
            {
                var channel = channelFactory.CreateChannel();
                var result =
                    personType == PersonType.Client
                        ? channel.GetClientNotes(personId, count, offset, sortDirection == ListSortDirection.Descending ? "desc" : "asc")
                        : channel.GetEmployeeNotes(personId, count, offset, sortDirection == ListSortDirection.Descending ? "desc" : "asc");



                return Mapper.Map<List<Note>>(result);
            }
        }
    }
}