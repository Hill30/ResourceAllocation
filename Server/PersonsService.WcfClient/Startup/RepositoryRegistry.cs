using System.Configuration;
using DomainModel.Services;
using StructureMap.Configuration.DSL;

namespace PersonsService.WcfClient.Startup
{
    public class RepositoryRegistry : Registry
    {
        public RepositoryRegistry()
        {
            For<IPersonsRepository>()
                 .Use<PersonsRepository>()
                 .Ctor<string>("_serviceUrl")
                 .Is(ConfigurationManager.AppSettings["PERSONS_SERVICE_URL"]);
        }
    }
}
