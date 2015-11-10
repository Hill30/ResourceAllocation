using System.Collections.Generic;
using System.ComponentModel;
using System.ServiceModel;
using System.ServiceModel.Web;

namespace PersonsServiceModel
{
    [ServiceContract]
    public interface IPersonsService
    {
        [OperationContract]
        [ServiceKnownType(typeof(Client))]
        [ServiceKnownType(typeof(Employee))]
        [WebGet(UriTemplate = "persons/search?searchString={searchString}&count={count}&offset={offset}&sortBy={sortBy}&sortDirection={sortDirection}", ResponseFormat = WebMessageFormat.Json)]
        List<Person> Search(string searchString, int count, int offset, string sortBy, string sortDirection);
        
        [OperationContract]
        [WebGet(UriTemplate = "persons/client?id={id}", ResponseFormat = WebMessageFormat.Json)]
        Client GetClient(int id);

        [OperationContract]
        [WebGet(UriTemplate = "persons/employee?id={id}", ResponseFormat = WebMessageFormat.Json)]
        Employee GetEmployee(int id);


        [OperationContract]
        [WebGet(UriTemplate = "persons/client_notes?clientId={clientId}&count={count}&offset={offset}&sortDirection={sortDirection}", ResponseFormat = WebMessageFormat.Json)]
        List<Note> GetClientNotes(int clientId, int count, int offset, string sortDirection);

        [OperationContract]
        [WebGet(UriTemplate = "persons/employee_notes?employeeId={employeeId}&count={count}&offset={offset}&sortDirection={sortDirection}", ResponseFormat = WebMessageFormat.Json)]
        List<Note> GetEmployeeNotes(int employeeId, int count, int offset, string sortDirection);
    }
}
