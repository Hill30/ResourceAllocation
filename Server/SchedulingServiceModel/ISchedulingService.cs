using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;

namespace SchedulingServiceModel
{
    [ServiceContract]
    public interface ISchedulingService
    {
        [OperationContract]
        [ServiceKnownType(typeof (Client))]
        [ServiceKnownType(typeof (Employee))]
        [WebGet(UriTemplate = "visits/list?personId={personId}&personType={personType}&startTime={startTime}&endTime={endTime}", ResponseFormat = WebMessageFormat.Json)]
        List<Visit> GetVisits(int personId, int personType, DateTime startTime, DateTime endTime);

    }
   
}
