using System;
using System.Collections.Generic;
using System.ServiceModel.Web;
using AutoMapper;
using DomainModel.Services;
using SchedulingServiceModel;
using PersonType = DomainModel.PersonType;
using Visit = DomainModel.Visit;

namespace SchedulingService.WcfClient
{
    public class VisitsRepository : IVisitsRepository
    {
        private readonly string _serviceUrl;

        public VisitsRepository(string _serviceUrl)
        {
            this._serviceUrl = _serviceUrl;
        }

        public List<Visit> GetVisits(int personId, PersonType personType, string processCode, DateTime startTime, DateTime endTime)
        {
            using (var channelFactory = new WebChannelFactory<ISchedulingService>(new Uri(_serviceUrl)))
            {
                var channel = channelFactory.CreateChannel();
                var result = channel.GetVisits(personId, (int)personType, startTime, endTime);
                return Mapper.Map<List<Visit>>(result);
            }
        }
    }
}