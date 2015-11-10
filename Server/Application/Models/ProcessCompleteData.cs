namespace Application.Models
{
    public class ProcessCompleteData
    {
        public int PersonId { get; set; }
        public string PersonType { get; set; }
        public int ProcessId { get; set; }
        public string ProcessCode { get; set; }
        public ProcessCompletePayloadData ProcessPayload { get; set; }
    }
}
