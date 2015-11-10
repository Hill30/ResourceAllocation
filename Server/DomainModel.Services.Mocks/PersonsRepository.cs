using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace DomainModel.Services.Mocks
{
    public class PersonsRepository : IPersonsRepository
    {
        private readonly List<Person> persons;
        private readonly List<Note> notes; 
        public PersonsRepository()
        {
            notes = new List<Note>
            {
                new Note{Id = 99, AuthorId = 55, PersonType = PersonType.Employee, Author = "Tolstoy, Leo", CreatedAt = DateTime.Now, Text = "It was funny."},
                new Note{Id = 55, AuthorId = 56, PersonType = PersonType.Client, Author = "Kafka, Franz", CreatedAt = DateTime.Now, Text = "It was not funny."}
            };
            persons = new List<Person>
            {
                new Employee
                {
                    Id = 1,
                    LastName = "Smith",
                    FirstName = "John",
                    Branch = new Branch{Id = 12, Name = "Branch1"},
                    Teams = new List<Team>()
                    {
                        new Team{Id = 173, Name = "Team1"}
                    },
                    Manager = new Employee{Id = 10, FirstName = "Ivan", LastName = "Susanin"},
                    Phone = "8-888-888-88-88",
                    Technology = "GSM/AMP",
                    IsFamilyCaregiver = true,
                    LastNote = notes[0]
                },
                new Client
                {
                    Id = 1,
                    LastName = "Ivanov",
                    FirstName = "Ivan",
                    Branch = new Branch{Id = 13, Name = "Branch2"},
                    Teams = new List<Team>()
                    {
                        new Team{Id = 18, Name = "Team2"}
                    },
                    Manager = new Employee{Id = 10, FirstName = "Ivan", LastName = "Susanin"},
                    Phone = "5-555-555-55-55",
                    LastNote = notes[1]                    
                }
            };
        }

        public List<Person> Search(string searchPattern, int count, int offset, string sortBy, ListSortDirection sortDirection)
        {
            var limit = offset >= 1 ? count : count + offset - 1;
            if (limit < 1)
                return new List<Person>();

            IEnumerable<Person> filtered = persons;
            if (! String.IsNullOrWhiteSpace(searchPattern))
                filtered = persons.Where(a => a.LastName.IndexOf(searchPattern, StringComparison.OrdinalIgnoreCase) >= 0 
                    || a.FirstName.Contains(searchPattern) 
                    || a.Phone.Contains(searchPattern));

            IOrderedEnumerable<Person> ordered;
            switch (sortBy)
            {
                case "name":
                    ordered = sortDirection == ListSortDirection.Descending
                                  ? filtered.OrderByDescending(a => a.LastName).ThenByDescending(a => a.FirstName)
                                  : filtered.OrderBy(a => a.LastName).ThenBy(a => a.FirstName);
                    break;
                case "location":
                    ordered = sortDirection == ListSortDirection.Descending
                                  ? filtered.OrderByDescending(a => a.Branch.Name)
                                  : filtered.OrderBy(a => a.Branch.Name);
                    break;
                case "phone":
                    ordered = sortDirection == ListSortDirection.Descending
                                  ? filtered.OrderByDescending(a => a.Phone)
                                  : filtered.OrderBy(a => a.Phone);
                    break;
                case "type":
                    ordered = sortDirection == ListSortDirection.Descending
                                  ? filtered.OrderByDescending(a => a.PersonType)
                                  : filtered.OrderBy(a => a.PersonType);
                    break;
                default:
                    ordered = sortDirection == ListSortDirection.Descending
                                  ? filtered.OrderByDescending(a => a.LastName).ThenByDescending(a => a.FirstName)
                                  : filtered.OrderBy(a => a.LastName).ThenBy(a => a.FirstName);
                    break;
            }

            ordered = ordered.ThenBy(x => x.Id);

            var qry = offset > 1 ? ordered.Skip(offset - 1) : ordered;

            var result = qry.Take(limit).ToList();
            return result;
        }

        public Employee GetEmployee(int id)
        {
            return (Employee)persons.First(p => p.PersonType == PersonType.Employee && p.Id == id);
        }

        public Client GetClient(int id)
        {
            return (Client)persons.First(p => p.PersonType == PersonType.Client && p.Id == id);
        }

        public List<Note> GetPersonNotes(int personId, PersonType personType, int count, int offset, ListSortDirection sortDirection)
        {
            var limit = offset >= 1 ? count : count + offset - 1;
            if (limit < 1)
                return new List<Note>();

            var filtered = notes.Where(p => p.PersonType == personType && p.AuthorId == personId);
            var ordered = sortDirection == ListSortDirection.Ascending
                 ? filtered.OrderBy(n => n.CreatedAt)
                 : filtered.OrderByDescending(n => n.CreatedAt);

            ordered = ordered.ThenBy(x => x.Id);
            var qry = offset > 1 ? ordered.Skip(offset - 1) : ordered;
            return qry.Take(limit).ToList();
        }
    }
}