using Microsoft.AspNetCore.Diagnostics;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Service.Exceptions;
using System.Text.Json;

namespace SampleEntDev.API.MiddleWares
{
    public static class UseCustomExceptionHandler
    {
        public static void UseCustomException(this IApplicationBuilder app)
        {
            _ = app.UseExceptionHandler(config =>
            {
                config.Run(async contex =>
                {
                    contex.Response.ContentType = "aaplication/json";
                    var exceptionFeature = contex.Features.Get<IExceptionHandlerFeature>();
                    var statusCode = exceptionFeature.Error switch
                    {
                        ClientSideException => 400,
                        _ => 500
                    };
                    contex.Response.StatusCode = statusCode;
                    var response = GResponseDto<NoContentDto>.Fail(statusCode, exceptionFeature.Error.Message);
                    await contex.Response.WriteAsync(JsonSerializer.Serialize(response));
                });
            });
        }
    }
}
