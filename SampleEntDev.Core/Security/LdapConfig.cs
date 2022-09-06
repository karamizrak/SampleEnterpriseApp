using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Security
{
    public class LdapConfig
    {
        public int Port { get; set; } = 389;
        public string Zone { get; set; } = string.Empty;
        public string Domain { get; set; } = string.Empty;
        public string LDAPserver { get; set; } = string.Empty;
        public string LDAPQueryBase { get; set; } = string.Empty;
        public string OUGroup { get; set; } = string.Empty;
        public string Path { get; set; } = string.Empty;
    }
}
