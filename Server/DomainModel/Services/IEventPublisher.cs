namespace DomainModel.Services
{
    public interface IEventPublisher
    {
        void PublishEvent(ProcessCompleteData data);
    }
}
