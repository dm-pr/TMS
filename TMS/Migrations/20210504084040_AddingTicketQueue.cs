using Microsoft.EntityFrameworkCore.Migrations;

namespace TMS.Migrations
{
    public partial class AddingTicketQueue : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TicketQueueId",
                table: "Tickets",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "TicketQueues",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CoordinatorId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TicketQueues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TicketQueues_AspNetUsers_CoordinatorId",
                        column: x => x.CoordinatorId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_TicketQueueId",
                table: "Tickets",
                column: "TicketQueueId");

            migrationBuilder.CreateIndex(
                name: "IX_TicketQueues_CoordinatorId",
                table: "TicketQueues",
                column: "CoordinatorId");

            migrationBuilder.AddForeignKey(
                name: "FK_Tickets_TicketQueues_TicketQueueId",
                table: "Tickets",
                column: "TicketQueueId",
                principalTable: "TicketQueues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tickets_TicketQueues_TicketQueueId",
                table: "Tickets");

            migrationBuilder.DropTable(
                name: "TicketQueues");

            migrationBuilder.DropIndex(
                name: "IX_Tickets_TicketQueueId",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "TicketQueueId",
                table: "Tickets");
        }
    }
}
