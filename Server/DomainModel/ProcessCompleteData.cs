namespace DomainModel
{
    public class ProcessCompleteData
    {
        public int CallId { get; set; }
        public int PersonId { get; set; }
        public PersonType PersonType { get; set; }
        public int ProcessId { get; set; }
        public string ProcessCode { get; set; }
        public ProcessCompletePayloadData ProcessPayload { get; set; }
    }
}
