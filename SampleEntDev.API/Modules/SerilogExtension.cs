using Serilog.Events;
using Serilog.Filters;
using Serilog;
using System.Reflection;
using Serilog.Exceptions;
using Serilog.Formatting.Compact;
using Serilog.Formatting.Elasticsearch;
using Serilog.Formatting.Json;
using Serilog.Sinks.Elasticsearch;
using Microsoft.AspNetCore.Http.Features;
using SampleEntDev.API.MiddleWares;

namespace SampleEntDev.API.Modules
{
    public static class SerilogExtension
    {
        public static WebApplicationBuilder? AddSerilog(this WebApplicationBuilder builder)
        {
            var environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
            var configuration = new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile($"appsettings.{environment}.json", optional: true)
                .Build();

            if (environment == null)
                return null;

            var applicationName = Assembly.GetExecutingAssembly().GetName().Name;
            if (applicationName == null)
                return null;

            Log.Logger = new LoggerConfiguration()
                .ReadFrom.Configuration(configuration)
                .MinimumLevel.Override("Microsoft", LogEventLevel.Information)
                .MinimumLevel.Override("System", LogEventLevel.Information)
                .Enrich.FromLogContext()
                .Enrich.WithProperty("ApplicationName", $"{applicationName} - {environment}")
                .Enrich.WithProperty("Coder", "Osman Karamızrak")
                .Enrich.WithCorrelationId()
                .Enrich.WithExceptionDetails()
                .Filter.ByExcluding(Matching.FromSource("Microsoft.AspNetCore.StaticFiles"))
                .WriteTo.Async(writeTo => writeTo.Console(new JsonFormatter()))
                .WriteTo.Async(writeTo => writeTo.Debug(new RenderedCompactJsonFormatter()))
                .WriteTo.Async(writeTo => writeTo.File("log.txt", rollingInterval: RollingInterval.Day))
                .WriteTo.Async(writeTo => writeTo.Elasticsearch(new ElasticsearchSinkOptions(new Uri(configuration["ElasticConfiguration:uri"] ?? throw new InvalidOperationException("Elastic Search config is not reading.")))
                {
                    TypeName = null,
                    AutoRegisterTemplate = true,
                    IndexFormat = $"{applicationName.ToLower()}-{DateTime.UtcNow:yyyy-MM}",
                    BatchAction = ElasticOpType.Create,
                    CustomFormatter = new ElasticsearchJsonFormatter(),
                    OverwriteTemplate = true,
                    DetectElasticsearchVersion = true,
                    AutoRegisterTemplateVersion = AutoRegisterTemplateVersion.ESv7,
                    NumberOfReplicas = 1,
                    NumberOfShards = 2,
                    FailureCallback = e => Console.WriteLine("Unable to submit event " + e.MessageTemplate),
                    EmitEventFailure = EmitEventFailureHandling.WriteToSelfLog |
                                                               EmitEventFailureHandling.WriteToFailureSink |
                                                               EmitEventFailureHandling.RaiseCallback |
                                                               EmitEventFailureHandling.ThrowException
                }))
               .CreateLogger();

            builder.Logging.ClearProviders();
            builder.Host.UseSerilog(Log.Logger, true);

            return builder;
        }

        public static WebApplication UseSerilog(this WebApplication app)
        {
            app.UseMiddleware<ErrorHandlingMiddleware>();
            app.UseSerilogRequestLogging(opts => { opts.EnrichDiagnosticContext = EnrichFromRequest; });
            return app;
        }

        private static void EnrichFromRequest(IDiagnosticContext diagnosticContext, HttpContext httpContext)
        {
            diagnosticContext.Set("CustomField.UserName", httpContext?.User.Identity?.Name);
            diagnosticContext.Set("CustomField.ClientIP", httpContext?.Connection.RemoteIpAddress?.ToString());
            diagnosticContext.Set("CustomField.UserAgent", httpContext?.Request.Headers["User-Agent"].FirstOrDefault());
            diagnosticContext.Set("CustomField.Developer", httpContext?.Request.Headers["developer"].FirstOrDefault());
            diagnosticContext.Set("CustomField.Resource", httpContext?.GetMetricsCurrentResourceName());
            diagnosticContext.Set("CustomField.MethodType", httpContext?.Request.Method);
            diagnosticContext.Set("CustomField.StatusCode", httpContext?.Response.StatusCode);
        }

        private static string? GetMetricsCurrentResourceName(this HttpContext httpContext)
        {
            if (httpContext == null)
                throw new ArgumentNullException(nameof(httpContext));

            var endpoint = httpContext.Features.Get<IEndpointFeature>()?.Endpoint;
            return endpoint?.Metadata.GetMetadata<EndpointNameMetadata>()?.EndpointName;
        }
    }
}
