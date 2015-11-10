using System.Collections.Generic;

namespace DomainModel
{
    public abstract class Person
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public abstract PersonType PersonType { get; }
        public Branch Branch { get; set; }
        public List<Team> Teams { get; set; }
        public Person Manager { get; set; }
        public string Phone { get; set; }
        public Note LastNote { get; set; }
    }
}