using NpgsqlTypes;
using Serilog;
using Serilog.Core;
using Serilog.Events;
using Serilog.Extensions.Logging;
using Serilog.Sinks.PostgreSQL;
using ILogger = Microsoft.Extensions.Logging.ILogger;

namespace SampleEntDev.API.Modules
{
    public static class SeriLogModule
    {
        //Used columns (Key is a column name) 
        //Column type is writer's constructor parameter
        static IDictionary<string, ColumnWriterBase> columnWriters = new Dictionary<string, ColumnWriterBase>
        {
            { "message", new RenderedMessageColumnWriter(NpgsqlDbType.Text) },
            { "message_template", new MessageTemplateColumnWriter(NpgsqlDbType.Text) },
            { "level", new LevelColumnWriter(true, NpgsqlDbType.Varchar) },
            { "raise_date", new TimestampColumnWriter(NpgsqlDbType.Timestamp) },
            { "exception", new ExceptionColumnWriter(NpgsqlDbType.Text) },
            { "properties", new LogEventSerializedColumnWriter(NpgsqlDbType.Jsonb) },
            { "props_test", new PropertiesColumnWriter(NpgsqlDbType.Jsonb) },
            {
                "machine_name",
                new SinglePropertyColumnWriter("MachineName", PropertyWriteMethod.ToString, NpgsqlDbType.Text, "l")
            }
        };

        public static ILoggingBuilder AddSeriLogx(this ILoggingBuilder builder, string connStr,
            bool dispose = false)
        {
            var loggerx = new LoggerConfiguration()
                .Enrich.FromLogContext()
                .Enrich.WithProperty("Application", "Sample Enterprise Api")
                .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
                .MinimumLevel.Override("System", LogEventLevel.Warning)
                .WriteTo.PostgreSQL(connStr, "audit_logs", columnWriters, schemaName: "global",
                    needAutoCreateTable: true)
                //new ElasticsearchSinkOptions(
                //    new Uri("http://localhost:9200/"))
                //{
                //    CustomFormatter = new ExceptionAsObjectJsonFormatter(renderMessage: true),
                //    AutoRegisterTemplate = true,
                //    TemplateName = "serilog-events-template",
                //    IndexFormat = "hesapkurdu-log-{0:yyyy.MM.dd}"
                //})
                .MinimumLevel.Verbose()
                .CreateLogger();
            
            if (builder == null)
                throw new ArgumentNullException(nameof(builder));
            if (dispose)
                ServiceCollectionServiceExtensions.AddSingleton<ILoggerProvider, SerilogLoggerProvider>(
                    builder.Services,
                    (Func<IServiceProvider, SerilogLoggerProvider>)(services =>
                        new SerilogLoggerProvider(loggerx, true)));
            else
                builder.AddProvider((ILoggerProvider)new SerilogLoggerProvider(loggerx));
            builder.AddFilter<SerilogLoggerProvider>(null, LogLevel.Trace);

            return builder;
        }
    }
}