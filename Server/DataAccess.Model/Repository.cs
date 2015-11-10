using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Model
{
    public class Repository
    {
        public DbContext CreateContext()
        {
            return new ContactCenterWorkflowEntities();
        }

        public void CloseContext(DbContext context)
        {
            context.Dispose();
        }
    }
}
