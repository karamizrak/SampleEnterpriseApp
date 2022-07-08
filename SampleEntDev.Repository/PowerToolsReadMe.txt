You need to do some setup for your app after "Reverse Engineer" has created the Entity Model classes and DbContext for you. 

Here are some hints:

## ASP.NET Core 6.0

1. Register your data context class in your "Program.cs" file.

    builder.Services.AddNpgsql<AppDbContext>(builder.Configuration.GetConnectionString("DefaultConnection"));

2. Add "ConnectionStrings" to your configuration file (secrets.json, appsettings.Development.json or appsettings.json).

    {
        "ConnectionStrings": {
            "DefaultConnection": "Server=127.0.0.1;Port=5432;Database=nlayerdb;User Id=nlayer;Password=12345;"
        }
    }


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
          
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Server=127.0.0.1;Port=5432;Database=nlayerdb;User Id=nlayer;Password=12345;");
            }

        }