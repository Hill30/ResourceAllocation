using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace SchedulingServiceModel
{
    [DataContract]
    [KnownType(typeof(Client))]
    [KnownType(typeof(Employee))]
    public abstract class Person
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public Branch Branch { get; set; }

        [DataMember]
        public Team Team { get; set; }

        [DataMember]
        public string Phone { get; set; }

        [DataMember]
        public Note LastNote { get; set; }

        public abstract PersonType PersonType { get; }
    }
}
