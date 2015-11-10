using System;
using System.Threading;
using System.Web;
using System.Web.Http;
using System.IdentityModel.Tokens;
using System.IdentityModel.Services;
using System.Security.Claims;

namespace Application
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class WebApplication : System.Web.HttpApplication
    {
        protected void Application_Start() 
        {
            Core.Startup.Application.Start();
        }

        protected void Application_PostAuthenticateRequest(Object sender, EventArgs e)
        {
            var context = HttpContext.Current;
            var authenticationManager = FederatedAuthentication.FederationConfiguration.IdentityConfiguration.ClaimsAuthenticationManager;

            if (authenticationManager != null && context.User is ClaimsPrincipal)
            {
                var transformedPrincipal = authenticationManager.Authenticate(context.Request.RawUrl, context.User as ClaimsPrincipal);

                context.User = transformedPrincipal;
                Thread.CurrentPrincipal = transformedPrincipal;
            }
        }
    }
}