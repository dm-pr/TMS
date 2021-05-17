using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TMS.ViewModels;
using TMS.Data;
using TMS.Models;

namespace TMS.Areas.Coordinator.Controllers
{
    /// <summary>
    /// This controller handles only adding new custom tickets.
    /// </summary>
    [Area("Coordinator")]
    [Authorize(Roles = "Coordinator")]
    public class NewTicketController : Controller
    {
                
        public IActionResult Start()
        {
            return View();            
        }

        [HttpPost]
        public IActionResult Save(TicketViewModel input, [FromServices] ITicketRepository ticketRepository, [FromServices] IMapper mapper)
        {        
            ticketRepository.AddTicket( mapper.Map<Ticket>(input));
            return RedirectToAction("start", "start");
        }
    }
}
