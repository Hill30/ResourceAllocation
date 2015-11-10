using System.Runtime.Serialization;

namespace SchedulingServiceModel
{
    public class Client : Person
    {
        public override PersonType PersonType
        {
            get { return PersonType.Client; }
        }
    }
}
