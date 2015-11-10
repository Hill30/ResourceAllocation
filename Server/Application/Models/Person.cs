namespace Application.Models
{
    public class Person
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Location { get; set; }
        public Team Team { get; set; }
        public Branch Branch { get; set; }
        public Person Manager { get; set; }
        public string Phone { get; set; }
        public Note LastNote { get; set; } 
    }
}