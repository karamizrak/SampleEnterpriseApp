namespace SampleEntDev.API.Config
{
    public static class CrossOrginDiConfig
    {
        public  static void AddCrossOrgin(this WebApplicationBuilder builder)
        {
            builder.Services.AddCors(opts =>
            {
                opts.AddDefaultPolicy(builder => { builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod(); });
            });
        }

    }
}
