using System;
using System.Collections.Generic;
using System.Web.Http;
using Application.Common;
using AutoMapper;
using DomainModel.Services;

namespace Application.Controllers
{
    public class VisitsController : ApiController
    {
        private readonly IVisitsRepository visitsRepository;

        public VisitsController(IVisitsRepository visitsRepository)
        {
            this.visitsRepository = visitsRepository;
        }

        public List<Models.Visit> Get(int personId, string personType, string processCode, DateTime dateFrom, DateTime dateTo)
        {
            var result = visitsRepository.GetVisits(personId, Helper.GetPersonType(personType), 
                processCode, dateFrom, dateTo);
            return Mapper.Map<List<Models.Visit>>(result);
        }
    }
}
