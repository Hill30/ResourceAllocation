using System;
using System.Collections.Generic;

namespace Application.Models
{
    public class ProcessCompletePayloadData
    {
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public List<int> Visits { get; set; }
    }
}