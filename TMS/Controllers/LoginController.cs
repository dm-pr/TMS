using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using TMS.Data;
using TMS.Models;

namespace TMS.Controllers
{
    /// <summary>
    /// This controller handles login and redirecting to appropriate areas.
    /// Also shows error if an exception is thrown.
    /// </summary>
    public class LoginController : Controller
    {
        private readonly UserManager<TMSUser> UserMgr;
        private readonly RoleManager<TMSRole> RoleMgr;
        private readonly SignInManager<TMSUser> SignInMgr;
        private readonly AppDbContext _context;

        public LoginController(UserManager<TMSUser> userManager, SignInManager<TMSUser> signInManager, RoleManager<TMSRole> roleManager, AppDbContext context)
        {
            UserMgr = userManager;
            RoleMgr = roleManager;
            SignInMgr = signInManager;
            _context = context;
        }


        //Start view with login form
        public IActionResult Login()
        {
            return View();
        }

        //Do actual login and redirect to assigned area
        public async Task<IActionResult> PerformLogin(LoginModel loginModel)
        {

            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("loginerror", "Wrong input parameters");
                return View("Login");
            }

            var result = await SignInMgr.PasswordSignInAsync(loginModel.Username, loginModel.Password, false, false);

            if (result.Succeeded)
            {
                var user = await UserMgr.FindByNameAsync(loginModel.Username);
                var roles = await UserMgr.GetRolesAsync(user);

                if (roles[0] == "Coordinator")
                {
                    return RedirectToRoute("areas", new { controller = "Start", area = "Coordinator", action = "Start" });
                }
                else if (roles[0] == "Operator")
                {
                    return RedirectToRoute("areas", new { controller = "Start", area = "Operator", action = "Start" });
                }

                return View("Login");
            }

            ModelState.AddModelError("loginerror", result.ToString());
            return View("Login");
        }


        //Performs a logout of current user
        public async Task<IActionResult> PerformLogout()
        {
            await SignInMgr.SignOutAsync();
            return View("Login");
        }


        //This executes on exception errors.  Thus not on HTTP Code errors, like 404.
        public async Task<IActionResult> Error()
        {
            //I want to sign out the user if an exception is thrown
            await SignInMgr.SignOutAsync();

            ModelState.AddModelError("error", "An error has occured. Contact staff");

            return View("Login");
        }



        //Seed data methods. Use these if not scripting database, but going migrations route.
       
        public async Task<IActionResult> SeedUsersAndRoles()
        {
            TMSRole cRole = new TMSRole();
            TMSRole oRole = new TMSRole();

            cRole.Name = "Coordinator";
            oRole.Name = "Operator";

            await RoleMgr.CreateAsync(cRole);
            await RoleMgr.CreateAsync(oRole);


            Coordinator c1 = new Coordinator()
            {
                Email = "c1@tms.com",
                Name = "Coordinator 1",
                UserName = "Coordinator1"
            };

            Operator o1 = new Operator()
            {
                Email = "o1@tms.com",
                Name = "Operator 1",
                UserName = "Operator1"
            };

            Operator o2 = new Operator()
            {
                Email = "o2@tms.com",
                Name = "Operator 2",
                UserName = "Operator2"
            };


            await UserMgr.CreateAsync(c1, "cPass1");
            await UserMgr.CreateAsync(o1, "oPass1");
            await UserMgr.CreateAsync(o2, "oPass2");

            var addedUser = await UserMgr.FindByNameAsync(c1.UserName);
            await UserMgr.AddToRoleAsync(addedUser, "Coordinator");

            addedUser = await UserMgr.FindByNameAsync(o1.UserName);
            await UserMgr.AddToRoleAsync(addedUser, "Operator");

            addedUser = await UserMgr.FindByNameAsync(o2.UserName);
            await UserMgr.AddToRoleAsync(addedUser, "Operator");




            _context.SaveChanges();
            return View("Login");
        }

        public IActionResult SeedTickets()
        {
            List<Ticket> tickets = new List<Ticket>();
            for(int i = 0;i<=100;i++)
            {
                tickets.Add(Ticket.MockUpTicket());
            }
            _context.Tickets.AddRange(tickets.ToArray());
            _context.SaveChanges();

            foreach (var ticket in _context.Tickets.Where(t => String.IsNullOrEmpty(t.TicketBody)))
            {
                _context.Tickets.Remove(ticket);
            }
            _context.SaveChanges();
            return View("Login");
        }

        
    }
}



