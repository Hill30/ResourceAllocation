using System;
using System.Collections.Generic;

namespace MessagingModel
{
    public class CallOffEvent : ContactCenterEvent
    {
        public int CaregiverId { get; set; }
        public string Reason { get; set; }
        public List<int> VisitIds{ get; set; }
    }
}
