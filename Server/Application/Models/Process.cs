using System.Collections.Generic;
using DomainModel;

namespace Application.Models
{
    public class Process
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string CallType { get; set; }
        public string CallerType { get; set; }
        public List<ProcessStep> Steps { get; set; }
        public List<Reason> Reasons { get; set; }
    }
}