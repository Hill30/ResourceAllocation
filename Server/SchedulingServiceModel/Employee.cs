using System.Runtime.Serialization;

namespace SchedulingServiceModel
{
    [DataContract]
    public class Employee : Person
    {
        public override PersonType PersonType
        {
            get { return PersonType.Employee; }
        }


        [DataMember]
        public string Technology { get; set; }
        
        [DataMember]
        public bool IsFamilyCaregiver { get; set; }
    }
}
