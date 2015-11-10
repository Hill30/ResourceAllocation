using Core.Messaging.ActiveMQ;
using DomainModel.Services;
using DomainModel.Services.Implementation;
using DomainModel.Services.Implementation.EventPublishers;
using log4net;
using StructureMap.Configuration.DSL;

namespace Application.Startup
{
    public class ProcessCompleteServiceRegistry : Registry
    {
        private const string CALL_OFF_CONFIG = "CallOffTopic";
        private const string CHANGE_IN_CONDITION_CONFIG = "ChangeInCoditionTopic";

        public ProcessCompleteServiceRegistry()
        {
            var changeInConditionConfig = ActiveMqConnections.Instances(CHANGE_IN_CONDITION_CONFIG);
            var callOffConfig = ActiveMqConnections.Instances(CALL_OFF_CONFIG);
            
            For<IProcessCompleteService>()
                .Singleton()
                .Use<ProcessCompleteService>()
                .Ctor<IEventPublisher[]>()
                .Is(i => i.Is.ConstructedBy(
                        c => new IEventPublisher[]
                            {
                                new CallOffEventPublisher(c.GetInstance<ILog>(), callOffConfig.Broker, callOffConfig.QueueName), 
                                new ChangeInConditionEventPublisher(c.GetInstance<ILog>(), changeInConditionConfig.Broker, changeInConditionConfig.QueueName), 
                            }));
        }
    }
}