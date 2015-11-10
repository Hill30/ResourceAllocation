namespace MessagingModel
{
    public class ChangeInConditionEvent : ContactCenterEvent
    {
        public int CaregiverId { get; set; }
        public int VisitId { get; set; }
        public string Note { get; set; }
    }
}
