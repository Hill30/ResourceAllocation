using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using AutoMapper;
using DomainModel;

namespace DataAccess.Model
{
    public class ProcessesRepository : IProcessesRepository
    {
        public List<DomainModel.Process> GetAll()
        {
            using (var context = new ContactCenterWorkflowEntities())
            {
                var list = context.Processes
                    .OrderBy(p => p.SortOrder)
                    .Include("ProcessSteps.Step")
                    .Include(p => p.Reasons)
                    .ToList();
                var processes = Mapper.Map<List<DomainModel.Process>>(list);
                return processes;
            }
        }
    }
}