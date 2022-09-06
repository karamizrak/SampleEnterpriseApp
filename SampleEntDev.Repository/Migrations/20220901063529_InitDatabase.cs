using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace SampleEntDev.Repository.Migrations
{
    public partial class InitDatabase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "ecommerce");

            migrationBuilder.EnsureSchema(
                name: "management");

            migrationBuilder.EnsureSchema(
                name: "global");

            migrationBuilder.CreateSequence(
                name: "functions_id_seq",
                schema: "management",
                maxValue: 2147483647L);

            migrationBuilder.CreateSequence(
                name: "UserToRoles_id_seq",
                schema: "management",
                maxValue: 2147483647L);

            migrationBuilder.CreateTable(
                name: "category",
                schema: "ecommerce",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    name = table.Column<string>(type: "text", nullable: true),
                    description = table.Column<string>(type: "text", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_category", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "functions",
                schema: "management",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    function_name = table.Column<string>(type: "character varying", nullable: false),
                    area_name = table.Column<string>(type: "character varying", nullable: true),
                    controller_name = table.Column<string>(type: "character varying", nullable: false),
                    action_name = table.Column<string>(type: "character varying", nullable: false),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_functions", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "institution",
                schema: "global",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    name = table.Column<string>(type: "character varying", nullable: false),
                    address = table.Column<string>(type: "character varying", nullable: true),
                    phone = table.Column<string>(type: "character varying", nullable: true),
                    city_id = table.Column<int>(type: "integer", nullable: false),
                    county_id = table.Column<int>(type: "integer", nullable: true),
                    neighborhood_id = table.Column<int>(type: "integer", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_institution", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "roles",
                schema: "management",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    role_name = table.Column<string>(type: "character varying", nullable: false),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_roles", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "test",
                schema: "ecommerce",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    ad = table.Column<string>(type: "character varying", nullable: true),
                    soyad = table.Column<string>(type: "character varying", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_test", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "users",
                schema: "management",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    identity_number = table.Column<long>(type: "bigint", nullable: true),
                    name = table.Column<string>(type: "character varying", nullable: false),
                    surename = table.Column<string>(type: "character varying", nullable: false),
                    e_mail = table.Column<string>(type: "character varying", nullable: false),
                    password = table.Column<string>(type: "character varying", nullable: false),
                    last_login_datetime = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    record_status = table.Column<short>(type: "smallint", nullable: false),
                    last_modifier_id = table.Column<int>(type: "integer", nullable: false),
                    refresh_token = table.Column<string>(type: "character varying", nullable: true),
                    refresh_token_end_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_users", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "product",
                schema: "ecommerce",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    name = table.Column<string>(type: "text", nullable: true),
                    stock = table.Column<int>(type: "integer", nullable: false),
                    price = table.Column<float>(type: "real", nullable: false),
                    category_id = table.Column<int>(type: "integer", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_product", x => x.id);
                    table.ForeignKey(
                        name: "FK_product_category_category_id",
                        column: x => x.category_id,
                        principalSchema: "ecommerce",
                        principalTable: "category",
                        principalColumn: "id");
                });

            migrationBuilder.CreateTable(
                name: "menu",
                schema: "management",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "character varying", nullable: true),
                    url = table.Column<string>(type: "character varying", nullable: true, defaultValueSql: "'#'::character varying"),
                    parent_id = table.Column<int>(type: "integer", nullable: true),
                    icon_path = table.Column<string>(type: "character varying", nullable: true),
                    function_id = table.Column<int>(type: "integer", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_menu", x => x.id);
                    table.ForeignKey(
                        name: "FK_menu_functions_function_id",
                        column: x => x.function_id,
                        principalSchema: "management",
                        principalTable: "functions",
                        principalColumn: "id");
                });

            migrationBuilder.CreateTable(
                name: "role_to_functions",
                schema: "management",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    role_id = table.Column<int>(type: "integer", nullable: false),
                    function_id = table.Column<int>(type: "integer", nullable: false),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_role_to_functions", x => x.id);
                    table.ForeignKey(
                        name: "FK_role_to_functions_functions_function_id",
                        column: x => x.function_id,
                        principalSchema: "management",
                        principalTable: "functions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_role_to_functions_roles_role_id",
                        column: x => x.role_id,
                        principalSchema: "management",
                        principalTable: "roles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "user_to_funcitons",
                schema: "management",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    user_id = table.Column<int>(type: "integer", nullable: false),
                    function_id = table.Column<int>(type: "integer", nullable: false),
                    validity_period_start_time = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    validity_period_end_time = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_to_funcitons", x => x.id);
                    table.ForeignKey(
                        name: "FK_user_to_funcitons_functions_function_id",
                        column: x => x.function_id,
                        principalSchema: "management",
                        principalTable: "functions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_user_to_funcitons_users_user_id",
                        column: x => x.user_id,
                        principalSchema: "management",
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "user_to_roles",
                schema: "management",
                columns: table => new
                {
                    id = table.Column<int>(type: "integer", nullable: false),
                    created_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true, defaultValueSql: "CURRENT_TIMESTAMP"),
                    updated_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    user_id = table.Column<int>(type: "integer", nullable: false),
                    role_id = table.Column<int>(type: "integer", nullable: false),
                    validity_period_start_time = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    validity_period_end_time = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    is_deleted = table.Column<bool>(type: "boolean", nullable: true, defaultValueSql: "false"),
                    last_modifier = table.Column<string>(type: "character varying", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_to_roles", x => x.id);
                    table.ForeignKey(
                        name: "FK_user_to_roles_roles_role_id",
                        column: x => x.role_id,
                        principalSchema: "management",
                        principalTable: "roles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_user_to_roles_users_user_id",
                        column: x => x.user_id,
                        principalSchema: "management",
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "product_feature",
                schema: "ecommerce",
                columns: table => new
                {
                    product_id = table.Column<int>(type: "integer", nullable: false),
                    color = table.Column<string>(type: "text", nullable: true),
                    height = table.Column<int>(type: "integer", nullable: true),
                    width = table.Column<int>(type: "integer", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("product_feature_pkey", x => x.product_id);
                    table.ForeignKey(
                        name: "FK_product_feature_product_product_id",
                        column: x => x.product_id,
                        principalSchema: "ecommerce",
                        principalTable: "product",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_menu_function_id",
                schema: "management",
                table: "menu",
                column: "function_id");

            migrationBuilder.CreateIndex(
                name: "IX_product_category_id",
                schema: "ecommerce",
                table: "product",
                column: "category_id");

            migrationBuilder.CreateIndex(
                name: "IX_role_to_functions_function_id",
                schema: "management",
                table: "role_to_functions",
                column: "function_id");

            migrationBuilder.CreateIndex(
                name: "IX_role_to_functions_role_id",
                schema: "management",
                table: "role_to_functions",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "IX_user_to_funcitons_function_id",
                schema: "management",
                table: "user_to_funcitons",
                column: "function_id");

            migrationBuilder.CreateIndex(
                name: "IX_user_to_funcitons_user_id",
                schema: "management",
                table: "user_to_funcitons",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "IX_user_to_roles_role_id",
                schema: "management",
                table: "user_to_roles",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "IX_user_to_roles_user_id",
                schema: "management",
                table: "user_to_roles",
                column: "user_id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "institution",
                schema: "global");

            migrationBuilder.DropTable(
                name: "menu",
                schema: "management");

            migrationBuilder.DropTable(
                name: "product_feature",
                schema: "ecommerce");

            migrationBuilder.DropTable(
                name: "role_to_functions",
                schema: "management");

            migrationBuilder.DropTable(
                name: "test",
                schema: "ecommerce");

            migrationBuilder.DropTable(
                name: "user_to_funcitons",
                schema: "management");

            migrationBuilder.DropTable(
                name: "user_to_roles",
                schema: "management");

            migrationBuilder.DropTable(
                name: "product",
                schema: "ecommerce");

            migrationBuilder.DropTable(
                name: "functions",
                schema: "management");

            migrationBuilder.DropTable(
                name: "roles",
                schema: "management");

            migrationBuilder.DropTable(
                name: "users",
                schema: "management");

            migrationBuilder.DropTable(
                name: "category",
                schema: "ecommerce");

            migrationBuilder.DropSequence(
                name: "functions_id_seq",
                schema: "management");

            migrationBuilder.DropSequence(
                name: "UserToRoles_id_seq",
                schema: "management");
        }
    }
}
