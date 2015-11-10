using System;
using System.Collections.Generic;
using System.Linq;

namespace DomainModel.Services.Mocks
{
    public class VisitsRepository : IVisitsRepository
    {
        private readonly List<Person> persons;

        public VisitsRepository()
        {
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
                    Phone = "8-888-888-88-88",
                    Technology = "GSM/AMP",
                    IsFamilyCaregiver = true,
                    LastNote = new Note{Id = 99, AuthorId = 55, PersonType = PersonType.Employee, Author = "Tolstoy, Leo", CreatedAt = DateTime.Now, Text = "It was funny."}
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
                    Phone = "5-555-555-55-55",
                    LastNote = new Note{Id = 55, AuthorId = 56, PersonType = PersonType.Client, Author = "Kafka, Franz", CreatedAt = DateTime.Now, Text = "It was not funny."}                    
                }
            };    
        }

        public List<Visit> GetVisits(int personId, PersonType personType, string processCode, DateTime startTime, DateTime endTime)
        {
            return new List<Visit>
            {
                new Visit
                {
                    Id = 4,
                    Client = (Client)persons.FirstOrDefault(p => p.PersonType == PersonType.Client),
                    Employee = (Employee)persons.FirstOrDefault(p => p.PersonType == PersonType.Employee),
                    StartTime = new DateTime(2015, 2, 3, 16, 0, 0),
                    EndTime = new DateTime(2015, 2, 3, 17, 30, 0)
                }
            };
        }
    }
}