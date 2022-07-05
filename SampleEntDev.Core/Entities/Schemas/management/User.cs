using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class User:IEntity
    {
        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
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
