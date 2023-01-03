
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
        public virtual DbSet<Functions> Functions { get; set; } = null!;
        public virtual DbSet<Institution> Institution { get; set; } = null!;
        public virtual DbSet<Menu> Menu { get; set; } = null!;
        public virtual DbSet<Product> Product { get; set; } = null!;
        public virtual DbSet<ProductFeature> ProductFeature { get; set; } = null!;
        public virtual DbSet<RoleToFunctions> RoleToFunctions { get; set; } = null!;
        public virtual DbSet<Roles> Roles { get; set; } = null!;
        public virtual DbSet<Test> Test { get; set; } = null!;
        public virtual DbSet<UserToFuncitons> UserToFuncitons { get; set; } = null!;
        public virtual DbSet<UserToRoles> UserToRoles { get; set; } = null!;
        public virtual DbSet<Users> Users { get; set; } = null!;

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }
        
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Server=127.0.0.1;Port=5432;Database=nlayerdb;User Id=postgres;Password=Password1;");
            }

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new Configurations.CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.FunctionsConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.InstitutionConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.MenuConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.ProductConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.ProductFeatureConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.RoleToFunctionsConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.RolesConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.TestConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.UserToFuncitonsConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.UserToRolesConfiguration());
            modelBuilder.ApplyConfiguration(new Configurations.UsersConfiguration());

            modelBuilder.HasSequence("functions_id_seq", "management").HasMax(2147483647);

            modelBuilder.HasSequence("UserToRoles_id_seq", "management").HasMax(2147483647);

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
