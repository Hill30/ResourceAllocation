using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Http;
using Application.Common;
using AutoMapper;
using DomainModel.Services;

namespace Application.Controllers
{
    public class PersonsController : ApiController
    {
        private readonly IPersonsRepository personsRepository;

        public PersonsController(IPersonsRepository personsRepository)
        {
            this.personsRepository = personsRepository;
        }

        public List<Models.Person> Get(int count, int offset, string searchString = "", string sortBy = "", string sortOrder = "")
        {
            var result = personsRepository.Search(searchString, 
                count, offset, sortBy, 
                Helper.GetSortDirection(sortOrder, ListSortDirection.Ascending));
            return Mapper.Map<List<Models.Person>>(result);
        }
    }
}
