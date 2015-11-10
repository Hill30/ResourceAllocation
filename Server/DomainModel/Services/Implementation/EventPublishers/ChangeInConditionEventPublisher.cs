using System;
using AutoMapper;
using Core.Messaging.ActiveMQ;
using log4net;
using MessagingModel;

namespace DomainModel.Services.Implementation.EventPublishers
{
    public class ChangeInConditionEventPublisher : EventPublisher<ChangeInConditionEvent>
    {
        public ChangeInConditionEventPublisher(ILog log, string brokerName, string topicName) 
            : base(log, brokerName, topicName, "CIC", null)
        {
        }
    }
}