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
    public class RoleRepositoryTests
    {
        DbContextOptionsBuilder opt = new DbContextOptionsBuilder(new DbContextOptions<AppDbContext>());

        public RoleRepositoryTests()
        {
            opt.UseNpgsql("Server=127.0.0.1;Port=5432;Database=nlayerdb;User Id=nlayer;Password=12345;");
        }

        [TestMethod()]
        public void GetFunctionsInRoleTest()
        {
            var f = new RoleRepository(new AppDbContext((DbContextOptions<AppDbContext>)opt.Options));
            var fonctions = f.GetRolesByFunction(2, "Get", "Category", "ECommerce").Result;

            Assert.IsTrue(true);
        }
    }
}