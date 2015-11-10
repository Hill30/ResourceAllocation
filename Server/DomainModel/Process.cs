using System.Collections.Generic;

namespace DomainModel
{
    public class Process
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public CallType CallType { get; set; }
        public CallerType CallerType { get; set; }
        public List<ProcessStep> Steps { get; set; }
        public List<Reason> Reasons { get; set; }
    }
}
