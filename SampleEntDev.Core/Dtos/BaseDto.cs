using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos
{
    public abstract class BaseDto
    {
        public int Id { get; set; }

        [System.Text.Json.Serialization.JsonIgnore]
        public DateTime? CreatedDate { get; set; }

        [System.Text.Json.Serialization.JsonIgnore]
        public DateTime? UpdatedDate { get; set; }
    }
}