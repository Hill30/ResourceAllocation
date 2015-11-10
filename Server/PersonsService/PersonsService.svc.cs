using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using PersonsService.DataAccess;
using PersonsServiceModel;
using Client = PersonsServiceModel.Client;
using Employee = PersonsServiceModel.Employee;

namespace PersonsService
{
    public class PersonsService : IPersonsService
    {

        public List<Person> Search(string searchString, int count, int offset, string sortBy, string sortDirection)
        {

            var limit = offset >= 1 ? count : count + offset - 1;
            if (limit < 1)
                return new List<Person>();

            List<Person> filtered = new List<Person>();

            using (var context = new PersonsServiceEntities())
            {
                var clients = context.Clients
                                .Where(a => a.LastName.Contains(searchString)
                                            || a.FirstName.Contains(searchString)
                                            || a.Phone.Contains(searchString))
                                            .ToList()
                                            .Select(Mapper.Map<DataAccess.Client, Client>);
                var employees = context.Employees.Where(a => a.LastName.Contains(searchString)
                                                || a.FirstName.Contains(searchString)
                                                || a.Phone.Contains(searchString))
                                                .ToList()
                                                .Select(Mapper.Map<DataAccess.Employee, Employee>);
                filtered.AddRange(clients);
                filtered.AddRange(employees);
            }

            IOrderedEnumerable<Person> ordered;
            switch (sortBy)
            {
                case "name":
                    ordered = "desc".Equals(sortDirection)
                                  ? filtered.OrderByDescending(a => a.LastName).ThenByDescending(a => a.FirstName)
                                  : filtered.OrderBy(a => a.LastName).ThenBy(a => a.FirstName);
                    break;
                case "location":
                    ordered = "desc".Equals(sortDirection)
                                  ? filtered.OrderByDescending(a => a.Branch.Name)
                                  : filtered.OrderBy(a => a.Branch.Name);
                    break;
                case "phone":
                    ordered = "desc".Equals(sortDirection)
                                  ? filtered.OrderByDescending(a => a.Phone)
                                  : filtered.OrderBy(a => a.Phone);
                    break;
                case "type":
                    ordered = "desc".Equals(sortDirection)
                                  ? filtered.OrderByDescending(a => a.PersonType)
                                  : filtered.OrderBy(a => a.PersonType);
                    break;
                default:
                    ordered = "desc".Equals(sortDirection)
                                  ? filtered.OrderByDescending(a => a.LastName).ThenByDescending(a => a.FirstName)
                                  : filtered.OrderBy(a => a.LastName).ThenBy(a => a.FirstName);
                    break;
            }

            ordered = ordered.ThenBy(x => x.Id);

            var qry = offset > 1 ? ordered.Skip(offset - 1) : ordered;

            var result = qry.Take(limit).ToList();
            return result;
            
        }


        public Client GetClient(int id)
        {
            using (var context = new PersonsServiceEntities())
            {
                return Mapper.Map<DataAccess.Client, Client>(context.Clients.FirstOrDefault(c => c.Id == id));
            }
        }

        public Employee GetEmployee(int id)
        {
            using (var context = new PersonsServiceEntities())
            {
                return Mapper.Map<DataAccess.Employee, Employee>(context.Employees.FirstOrDefault(c => c.Id == id));
            }
        }

        public List<Note> GetClientNotes(int clientId, int count, int offset, string sortDirection)
        {
            var limit = offset >= 1 ? count : count + offset - 1;
            if (limit < 1)
                return new List<Note>();

            using (var context = new PersonsServiceEntities())
            {
                var filtered = context.ClientNotes.Where(p => p.Client_Id == clientId);
                var ordered = "desc".Equals(sortDirection)
                    ? filtered.OrderBy(n => n.CreatedAt)
                    : filtered.OrderByDescending(n => n.CreatedAt);

                ordered = ordered.ThenBy(x => x.Id);
                var qry = offset > 1 ? ordered.Skip(offset - 1) : ordered;
                return qry.Take(limit).ToList().Select(Mapper.Map<ClientNote, Note>).ToList();
             }
        }

        public List<Note> GetEmployeeNotes(int employeeId, int count, int offset, string sortDirection)
        {
            var limit = offset >= 1 ? count : count + offset - 1;
            if (limit < 1)
                return new List<Note>();

            using (var context = new PersonsServiceEntities())
            {

                var filtered = context.EmployeeNotes.Where(p => p.Employee_Id == employeeId);
                    var ordered = "desc".Equals(sortDirection)
                        ? filtered.OrderBy(n => n.CreatedAt)
                        : filtered.OrderByDescending(n => n.CreatedAt);

                    ordered = ordered.ThenBy(x => x.Id);
                    var qry = offset > 1 ? ordered.Skip(offset - 1) : ordered;
                    return qry.Take(limit).ToList().Select(Mapper.Map<EmployeeNote, Note>).ToList();                
           }
        }


    }
}
