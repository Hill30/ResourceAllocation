using System;
using System.Collections.Generic;
using AutoMapper;
using Core.Messaging.ActiveMQ;
using log4net;

namespace DomainModel.Services.Implementation
{
    public abstract class EventPublisher<TEventType> : IEventPublisher where TEventType : class
    {
        private readonly ILog log;
        private readonly string brokerName;
        private readonly string topicName;
        private readonly string processCode;
        private readonly Func<ProcessCompleteData, TEventType> eventCreator;

        protected EventPublisher(ILog log, string brokerName, string topicName, string processCode, Func<ProcessCompleteData, TEventType> eventCreator)
        {
            this.log = log;
            this.brokerName = brokerName;
            this.topicName = topicName;
            this.processCode = processCode;
            this.eventCreator = eventCreator ?? (Mapper.Map<TEventType>);
        }

        public virtual void PublishEvent(ProcessCompleteData data)
        {
            if (!String.Equals(processCode, data.ProcessCode, StringComparison.InvariantCultureIgnoreCase))
                return;

            try
            {
                var message = eventCreator(data);
                using (var publisher = new Publisher<TEventType>(brokerName, topicName, log, true))
                {
                    publisher.SendMessage(message);
                }
            }
            catch (Exception ex)
            {
                var errMessage = String.Format("Message to '{0}' topic has not been sent. Call ID: {1}", topicName, data.CallId);
                log.Error(errMessage, ex);
            }
        }
    }
}