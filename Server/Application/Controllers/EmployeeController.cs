using System.Web.Http;
using AutoMapper;
using DomainModel.Services;

namespace Application.Controllers
{
    public class EmployeeController : ApiController
    {
        private readonly IPersonsRepository personsRepository;

        public EmployeeController(IPersonsRepository personsRepository)
        {
            this.personsRepository = personsRepository;
        }

        public Models.Employee Get(int id)
        {
            var result = personsRepository.GetEmployee(id);
            return Mapper.Map<Models.Employee>(result);
        }
    }
}
