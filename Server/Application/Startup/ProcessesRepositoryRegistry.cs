using DataAccess.Model;
using DomainModel;
using StructureMap.Configuration.DSL;

namespace Application.Startup
{
    public class ProcessesRepositoryRegistry : Registry
    {
        public ProcessesRepositoryRegistry()
        {
            For<IProcessesRepository>()
                .Singleton()
                .Use<ProcessesRepository>(); 
        } 
    }
}