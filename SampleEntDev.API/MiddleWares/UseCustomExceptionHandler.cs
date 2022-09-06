using Microsoft.AspNetCore.Diagnostics;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Service.Exceptions;
using System.Text.Json;
using NuGet.Protocol;

namespace SampleEntDev.API.MiddleWares
{
    public static class UseCustomExceptionHandler
    {
        public static void UseCustomException(this IApplicationBuilder app, ILogger logger)
        {
            _ = app.UseExceptionHandler(config =>
            {
                config.Run(async contex =>
                {
                    var response = GetResonse(contex, logger);
                    await contex.Response.WriteAsync(JsonSerializer.Serialize(response));
                });
            });
        }

        private static GResponseDto<NoContentDto> GetResonse(HttpContext contex, ILogger logger)
        {
            contex.Response.ContentType = "aplication/json";
            var exceptionFeature = contex.Features.Get<IExceptionHandlerFeature>();
            var statusCode = exceptionFeature.Error
                switch
                {
                    ClientSideException => 400,
                    NotFoundException => 404,
                    _ => 500
                };
            contex.Response.StatusCode = statusCode;
            var response = GResponseDto<NoContentDto>.Fail(statusCode, exceptionFeature.Error.GetBaseException().Message);

            logger.LogError(String.Format("HttpRequest: {0}",
                exceptionFeature.Error.StackTrace.ToString()));
            return response;
        }
    }
}