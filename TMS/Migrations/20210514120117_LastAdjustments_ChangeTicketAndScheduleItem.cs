using Microsoft.EntityFrameworkCore.Migrations;

namespace TMS.Migrations
{
    public partial class LastAdjustments_ChangeTicketAndScheduleItem : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "OperatorReport",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "CoordinatorId",
                table: "ScheduleItem");

            migrationBuilder.AddColumn<string>(
                name: "CoordinatorName",
                table: "ScheduleItem",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CoordinatorName",
                table: "ScheduleItem");

            migrationBuilder.AddColumn<string>(
                name: "OperatorReport",
                table: "Tickets",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CoordinatorId",
                table: "ScheduleItem",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
