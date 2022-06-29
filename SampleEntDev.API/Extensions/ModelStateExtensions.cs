using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace SampleEntDev.API.Extensions
{
    public static class ModelStateExtensions
    {
        public static List<string> GetErrorMesages(this ModelStateDictionary dictionary)
        {
            return dictionary.SelectMany(x => x.Value.Errors).Select(x => x.ErrorMessage).ToList();
        }
    }
}
