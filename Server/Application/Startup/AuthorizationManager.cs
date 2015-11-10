using System.Security.Claims;

namespace Application
{
    public class AuthorizationManager : ClaimsAuthorizationManager
    {
        public override bool CheckAccess(AuthorizationContext context)
        {
            return true;
        }
    }
}