using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ECommerce;

namespace SampleEntDev.Web.Services
{
    public class CategoryApiService
    {
        private readonly HttpClient _httpClient;

        public CategoryApiService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<List<CategoryDto>> GetAll()
        {
            var response = await _httpClient.GetFromJsonAsync<GResponseDto<List<CategoryDto>>>("ecommerce/category");
            return response.Data;
        }
    }
}
