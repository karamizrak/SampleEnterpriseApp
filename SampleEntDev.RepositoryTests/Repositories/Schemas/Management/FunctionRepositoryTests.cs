using Microsoft.VisualStudio.TestTools.UnitTesting;
using SampleEntDev.Repository.Repositories.Schemas.Management;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace SampleEntDev.Repository.Repositories.Schemas.Management.Tests
{
    [TestClass()]
    public class FunctionRepositoryTests
    {
        DbContextOptionsBuilder opt = new DbContextOptionsBuilder(new DbContextOptions<AppDbContext>());
        public FunctionRepositoryTests()
        {
            
            opt.UseNpgsql("Server=127.0.0.1;Port=5432;Database=nlayerdb;User Id=nlayer;Password=12345;");
        }
        [TestMethod()]
        public void GetUserAuthorizedFunctionsTest()
        {
            
            
            var f = new FunctionRepository(new AppDbContext((DbContextOptions<AppDbContext>)opt.Options));
            var fonctions = f.GetUserAuthorizedFunctions(2).Result;

          Assert.IsTrue(true);
        }
    }
}

/*
 * 
 * protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
          
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Server=127.0.0.1;Port=5432;Database=nlayerdb;User Id=nlayer;Password=12345;");
            }

        }
*/