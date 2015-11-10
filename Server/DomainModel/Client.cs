namespace DomainModel
{
    public class Client : Person
    {
        public override PersonType PersonType
        {
            get { return PersonType.Client; }
        }
    }
}