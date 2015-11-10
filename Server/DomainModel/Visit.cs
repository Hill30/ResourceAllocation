using System;

namespace DomainModel
{
    public class Visit
    {
        public int Id { get; set; }
        public Employee Employee { get; set; }
        public Client Client { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; } 
    }
}