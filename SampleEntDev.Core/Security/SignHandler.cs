using Microsoft.IdentityModel.Tokens;
using System.Text;


namespace SampleEntDev.Core.Security
{
    public static class SignHandler
    {
        public static SecurityKey GetSecurityKey(string securityKey)
        {
            var symmKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(securityKey));
            return symmKey;
        }
    }
}
