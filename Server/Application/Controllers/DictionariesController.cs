using System.Collections.Generic;
using System.Web.Http;
using AutoMapper;
using DomainModel;
using Process = Application.Models.Process;

namespace Application.Controllers
{
    public class Dictionaries
    {
        public List<Process> Processes { get; set; }
    }

    public class DictionariesController : ApiController
    {
        private readonly IProcessesRepository processesRepository;

        public DictionariesController(IProcessesRepository processesRepository)
        {
            this.processesRepository = processesRepository;
        }

        public Dictionaries Get()
        {
            var repoProcesses = processesRepository.GetAll();
            var modelProcesses = Mapper.Map<List<Process>>(repoProcesses);

            var result = new Dictionaries
            {
                Processes = modelProcesses
            };

            return result;
        }
    }
}
