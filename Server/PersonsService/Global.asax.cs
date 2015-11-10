using System;
using System.Web;

namespace PersonsService
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            Core.Startup.Application.Start();
        }

    }
}