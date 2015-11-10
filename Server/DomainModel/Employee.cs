namespace DomainModel
{
    public class Employee : Person
    {
        public override PersonType PersonType
        {
            get { return PersonType.Employee; }
        }

        public string Technology { get; set; }
        public bool IsFamilyCaregiver { get; set; }
    }
}