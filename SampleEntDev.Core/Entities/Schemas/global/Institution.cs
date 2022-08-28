using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Institution:IEntity
    {
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public int CityId { get; set; }
        public int? CountyId { get; set; }
        public int? NeighborhoodId { get; set; }
        public bool? IsDeleted { get; set; }
        public string? LastModifier { get; set; }
    }
}
