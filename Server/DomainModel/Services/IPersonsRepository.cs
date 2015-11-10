using System.Collections.Generic;
using System.ComponentModel;

namespace DomainModel.Services
{
    public interface IPersonsRepository
    {
        List<Person> Search(string searchPattern, int count, int offset, string sortBy, ListSortDirection sortDirection);
        Employee GetEmployee(int id);
        Client GetClient(int id);
        List<Note> GetPersonNotes(int personId, PersonType personType, int count, int offset, ListSortDirection sortDirection);
    }
}