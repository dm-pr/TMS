using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace TMS.Migrations
{
    public partial class ChangeSchedule_AddingScheduleItem : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tickets_OperatorSchedules_OperatorScheduleId",
                table: "Tickets");

            migrationBuilder.DropIndex(
                name: "IX_Tickets_OperatorScheduleId",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "OperatorScheduleId",
                table: "Tickets");

            migrationBuilder.CreateTable(
                name: "ScheduleItem",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StartTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CoordinatorId = table.Column<int>(type: "int", nullable: false),
                    OperatorScheduleId = table.Column<int>(type: "int", nullable: false),
                    TicketId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ScheduleItem", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ScheduleItem_OperatorSchedules_OperatorScheduleId",
                        column: x => x.OperatorScheduleId,
                        principalTable: "OperatorSchedules",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ScheduleItem_Tickets_TicketId",
                        column: x => x.TicketId,
                        principalTable: "Tickets",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ScheduleItem_OperatorScheduleId",
                table: "ScheduleItem",
                column: "OperatorScheduleId");

            migrationBuilder.CreateIndex(
                name: "IX_ScheduleItem_TicketId",
                table: "ScheduleItem",
                column: "TicketId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ScheduleItem");

            migrationBuilder.AddColumn<int>(
                name: "OperatorScheduleId",
                table: "Tickets",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_OperatorScheduleId",
                table: "Tickets",
                column: "OperatorScheduleId");

            migrationBuilder.AddForeignKey(
                name: "FK_Tickets_OperatorSchedules_OperatorScheduleId",
                table: "Tickets",
                column: "OperatorScheduleId",
                principalTable: "OperatorSchedules",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
