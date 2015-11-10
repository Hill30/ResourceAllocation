using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchedulingServiceModel
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
