using System.Runtime.Serialization;

namespace PersonsServiceModel
{
    [DataContract]
    public class Client : Person
    {
        public override PersonType PersonType
        {
            get { return PersonType.Client; }
            set
            {
                // set is here just to make WCF serializer happy
            }
        }
    }
}
