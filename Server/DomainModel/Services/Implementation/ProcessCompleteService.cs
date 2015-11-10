namespace DomainModel.Services.Implementation
{
    public class ProcessCompleteService : IProcessCompleteService
    {
        private readonly IEventPublisher[] eventPublishers;

        public ProcessCompleteService(IEventPublisher[] eventPublishers)
        {
            this.eventPublishers = eventPublishers;
        }

        public void CompleteProcess(ProcessCompleteData data)
        {
            foreach (var publisher in eventPublishers)
                publisher.PublishEvent(data);
        }
    }
}