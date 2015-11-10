using System;

namespace Application.Models
{
    public class Note
    {
        public int Id { get; set; }
        public int AuthorId { get; set; }
        public string AuthorType { get; set; }
        public string Author { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Text { get; set; } 
    }
}