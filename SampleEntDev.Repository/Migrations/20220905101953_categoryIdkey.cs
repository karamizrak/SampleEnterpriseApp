using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SampleEntDev.Repository.Migrations
{
    public partial class categoryIdkey : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Test",
                schema: "ecommerce",
                table: "category",
                type: "text",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Test",
                schema: "ecommerce",
                table: "category");
        }
    }
}
