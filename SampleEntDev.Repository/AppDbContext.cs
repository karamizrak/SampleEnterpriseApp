
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Repository.Configurations;
using System;
using System.Collections.Generic;
namespace SampleEntDev.Repository
{
    public partial class AppDbContext : DbContext
    {
        public virtual DbSet<Category> Category { get; set; } = null!;
        public virtual DbSet<Product> Product { get; set; } = null!;
        public virtual DbSet<ProductFeature> ProductFeature { get; set; } = null!;
        public virtual DbSet<Test> Test { get; set; } = null!;
        public virtual DbSet<User> User { get; set; } = null!;

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new Configurations.CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.ProductConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.ProductFeatureConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.TestConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.UserConfiguration());

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
