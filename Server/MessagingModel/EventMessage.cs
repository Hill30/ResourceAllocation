using System;

namespace MessagingModel
{
    public class EventMessage
    {
        public DateTime MessageDate { get; set; }
        public ContactCenterEvent Event { get; set; }
    }
}
