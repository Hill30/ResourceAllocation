using Core.Messaging.ActiveMQ;
using DomainModel.Services;
using StructureMap.Configuration.DSL;

namespace Application.Startup
{
    public class EventPublishersRegistry : Registry
    {
        public EventPublishersRegistry()
        {
            //Scan(action =>
            //    {
            //        action.AssemblyContainingType<IEventPublisher>();
            //        action.AddAllTypesOf<IEventPublisher>();
            //    });
            ////For<IEventPublisher[]>().Use(x => ObjectFactory.GetAllInstances<IEventPublisher>().ToArray());
        }    
    }
}