using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace PersonsServiceModel
{
    [DataContract]
    [KnownType(typeof(Client))]
    [KnownType(typeof(Employee))]
    public abstract class Person
    {
//        protected PersonType _personType;
        
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public Branch Branch { get; set; }

        [DataMember]
        public List<Team> Teams { get; set; }

        [DataMember]
        public string Phone { get; set; }

        [DataMember]
        public Note LastNote { get; set; }

        [DataMember]
        public abstract PersonType PersonType
        {
            get;// { return _personType; }
            set;// { _personType = value; }
        }
    }
}
