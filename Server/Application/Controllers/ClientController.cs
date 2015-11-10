using System.Web.Http;
using AutoMapper;
using DomainModel.Services;

namespace Application.Controllers
{
    public class ClientController : ApiController
    {
        private readonly IPersonsRepository personsRepository;

        public ClientController(IPersonsRepository personsRepository)
        {
            this.personsRepository = personsRepository;
        }

        public Models.Client Get(int id)
        {
            var result = personsRepository.GetClient(id);
            return Mapper.Map<Models.Client>(result);
        }
    }
}
