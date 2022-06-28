using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ecommerce;

namespace SampleEntDev.Web.Services
{
    public class ProductApiService
    {
        private readonly HttpClient _httpClient;

        public ProductApiService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<List<ProductWithCategoryDto>> GetProductWithCategoryAsync()
        {
            var response = await _httpClient.GetFromJsonAsync<GResponseDto<List<ProductWithCategoryDto>>>("ecommerce/products/GetProductsWithCategory");
            return response.Data;
        }

        public async Task<ProductDto> Save(ProductDto productDto)
        {
            var response = await _httpClient.PostAsJsonAsync("ecommerce/product", productDto);
            if (!response.IsSuccessStatusCode) return null;

            var responseBody = await response.Content.ReadFromJsonAsync<GResponseDto<ProductDto>>();
            return responseBody.Data;
        }
        public async Task<bool> Update(ProductDto productDto)
        {
            var response = await _httpClient.PutAsJsonAsync("ecommerce/product", productDto);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> Remove(int id)
        {
            var response = await _httpClient.DeleteAsync($"ecommerce/product/{id}");
            return response.IsSuccessStatusCode;
        }

        public async Task<ProductDto> GetBydId(int id)
        {
            var response = await _httpClient.GetFromJsonAsync<GResponseDto<ProductDto>>($"ecommerce/product/{id}");
            return response.Data;
        }

    }
}
 