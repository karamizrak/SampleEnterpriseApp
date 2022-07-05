using System.ComponentModel.DataAnnotations;

namespace SampleEntDev.Core.Dtos.PublicDtos
{
    public class LoginDto
    {
        [Required]
        [EmailAddress]
        public string email { get; set; }
        [Required]
        public string password { get; set; }
    }
}
