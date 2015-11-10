using log4net;
using MessagingModel;

namespace DomainModel.Services.Implementation.EventPublishers
{
    public class CallOffEventPublisher : EventPublisher<CallOffEvent>
    {
        public CallOffEventPublisher(ILog log, string brokerName, string topicName)
            : base(log, brokerName, topicName, "CLF", null)
        {
        }
    }
}