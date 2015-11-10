using System.Collections.Generic;
using StructureMap;

namespace DomainModel
{
    public interface IProcessesRepository
    {
        List<Process> GetAll();
    }
}
