using System;
using System.Collections.Generic;

namespace DomainModel.Services
{
    public interface IVisitsRepository
    {
        List<Visit> GetVisits(int personId, PersonType personType, string processCode, DateTime startTime, DateTime endTime);
    }
}