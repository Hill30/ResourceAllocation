using System.Configuration;
using DomainModel.Services;
using StructureMap.Configuration.DSL;

namespace SchedulingService.WcfClient.Startup
{
    public class RepositoryRegistry : Registry
    {
        public RepositoryRegistry()
        {
            For<IVisitsRepository>()
                 .Use<VisitsRepository>()
                 .Ctor<string>("_serviceUrl")
                 .Is(ConfigurationManager.AppSettings["VISITS_SERVICE_URL"]);
        }
    }
}
