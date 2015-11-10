using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Http;
using Application.Common;
using AutoMapper;
using DomainModel.Services;

namespace Application.Controllers
{
    public class NotesController : ApiController
    {
        private readonly IPersonsRepository personsRepository;

        public NotesController(IPersonsRepository personsRepository)
        {
            this.personsRepository = personsRepository;
        }

        public List<Models.Note> Get(int personId, string personType, int count, int offset, string sortOrder = "asc")
        {
            var result = personsRepository.GetPersonNotes(personId, 
                Helper.GetPersonType(personType), 
                count, offset, Helper.GetSortDirection(sortOrder, ListSortDirection.Ascending));
            return Mapper.Map<List<Models.Note>>(result);
        }
    }
}
