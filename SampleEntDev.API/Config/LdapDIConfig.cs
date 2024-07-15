using SampleEntDev.Core.Security;
using System.Text;

namespace SampleEntDev.API.Config
{
    public static class LdapDiConfig
    {
        public static void AddLdapConfig(this WebApplicationBuilder builder)
        {
            LdapConfig ldapConfig = builder.Configuration.GetSection("AD").Get<LdapConfig>() ?? throw new InvalidOperationException("Ldap Configuration isn't reading!!!");
            builder.Services.Configure<LdapConfig>
            (
                c =>
                {
                    c.Zone = ldapConfig.Zone;
                    c.Port = ldapConfig.Port;
                    c.Path = ldapConfig.Path;
                    c.Domain = ldapConfig.Domain;
                    c.LDAPserver = $"{c.Domain}.{c.Zone}";
                    c.LDAPQueryBase = $"DC={c.Domain},DC={c.Zone}";
                    c.OUGroup = new StringBuilder().Append($"OU={ldapConfig.OUGroup},").Append($"CN=Users,{c.LDAPQueryBase}")
                        .ToString();
                }
            );
        }
    }
}
