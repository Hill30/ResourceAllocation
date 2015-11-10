using System.Net;
using System.Net.Http;
using System.Web.Http;
using Application.Models;
using AutoMapper;
using DomainModel.Services;

namespace Application.Controllers
{
    public class CompleteController : ApiController
    {
        private readonly IProcessCompleteService processCompleteService;

        public CompleteController(IProcessCompleteService processCompleteService)
        {
            this.processCompleteService = processCompleteService;
        }

        public HttpResponseMessage Post([FromBody] ProcessCompleteData data)
        {
            var domainModelData = Mapper.Map<DomainModel.ProcessCompleteData>(data);
            processCompleteService.CompleteProcess(domainModelData);
            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
