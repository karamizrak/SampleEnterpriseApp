using SampleEntDev.Web.Services;

namespace SampleEntDev.Web.HttpClients
{
    public static class ECommerceHttpClient
    {
        public static IServiceCollection AddECommerceHttpClient(this IServiceCollection Services,string baseUrl)
        {
            Services.AddHttpClient<ProductApiService>(opt =>
            {
                opt.BaseAddress = new Uri($"{baseUrl}/ecommerce/");
            });
            Services.AddHttpClient<CategoryApiService>(opt =>
            {
                opt.BaseAddress = new Uri($"{baseUrl}/ecommerce/");
            });
            return Services;
        }
    }
}
