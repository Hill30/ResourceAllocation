using System.Runtime.Serialization;

namespace PersonsServiceModel
{
    [DataContract]
    public class Employee : Person
    {
        [DataMember]
        public string Technology { get; set; }
        
        [DataMember]
        public bool IsFamilyCaregiver { get; set; }

         [DataMember]
        public override PersonType PersonType
        {
             get { return PersonType.Employee; }
             set
             {
                 // set is here just to make WCF serializer happy
             }
        }
    }
}
