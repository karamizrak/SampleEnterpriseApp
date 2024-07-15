using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.Management
{
    public class UserDto : IDto
    {
        public int Id { get; set; }
        public long? IdentityNumber { get; set; }
        public string Name { get; set; } = null!;
        public string Surename { get; set; } = null!;
        public string EMail { get; set; } = null!;
        public string Password { get; set; } = null!;

        public DateTime? LastLoginDatetime { get; set; }
        public short RecordStatus { get; set; }
        public int LastModifierId { get; set; }
        public string? RefreshToken { get; set; }
        public DateTime? RefreshTokenEndDate { get; set; }
    }
}