using System;

namespace MessagingModel
{
    public abstract class ContactCenterEvent
    {
        protected ContactCenterEvent()
        {
            CreatedAt = DateTime.UtcNow;
        }

        public DateTime CreatedAt { get; set; }
        public int Version { get; set; }
    }
}
