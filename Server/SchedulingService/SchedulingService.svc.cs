using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using SchedulingService.DataAccess;
using SchedulingServiceModel;

namespace SchedulingService
{
    public class SchedulingService : ISchedulingService
    {

        public List<Visit> GetVisits(int personId, int personType,  DateTime startTime, DateTime endTime)
        {
            using (var context = new SchedulingServiceEntities())
            {
                var startDate = startTime.Date;
                var endDate = endTime.Date;
                var startTimeOfTheDay = startTime.TimeOfDay;
                var endTimeOfTheDay = endTime.TimeOfDay;

                if (endTimeOfTheDay <= startTimeOfTheDay)
                {
                    endDate = endDate.AddDays(1);
                }

                var qry = personType == (int) PersonType.Client
                    ? context.Schedules.Where(sch => sch.ClientId == personId)
                    : context.Schedules.Where(sch => sch.EmployeeId == personId);

                return  qry
                            .Where(sch => sch.StartDate >= startDate)
                            .Where(sch => sch.StartDate <= endDate)
                            .Where(sch => sch.StartTime >= startTimeOfTheDay)
                            .Where(sch => sch.EndTime <= endTimeOfTheDay)
                            .ToList()
                    .Select(AutoMapper.Mapper.Map<DataAccess.Schedule, SchedulingServiceModel.Visit>).ToList();
            }
        }
    }
}
