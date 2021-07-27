using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.Data;
using TMS.Models;


namespace TMS
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();

            services.AddDbContext<AppDbContext>(opt => opt.UseSqlServer(Configuration.GetConnectionString("DBCONN")));

            services.AddScoped<ITicketRepository, TicketRepositorySql>();
            services.AddScoped<IOperatorRepository, OperatorRepositorySql>();
            services.AddScoped<IReportRepository, ReportRepositorySql>();
            
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

            services.AddIdentity<TMSUser, TMSRole>(set => {
                        set.SignIn.RequireConfirmedAccount = true;
                        set.User.RequireUniqueEmail = true;
                        set.Password.RequiredLength = 4;
                        set.Password.RequireNonAlphanumeric = false;
                        set.Password.RequireUppercase = false;                        
                        })
                        .AddEntityFrameworkStores<AppDbContext>();

            services.ConfigureApplicationCookie(opt =>  opt.LoginPath = "/");

        }

        

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if(env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/login/error/");  //exception handling
                app.UseHsts();
            }

            //just the most simple http error handling.  No redirects.
            app.UseStatusCodePages();


            app.UseHttpsRedirection();
            app.UseStaticFiles();
            
            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                  name: "areas",
                  pattern: "{area:exists}/{controller=Start}/{action=Start}/{id?}"
                );
            });            
            
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "api",
                    pattern: "{area:exists}/api/{controller=Api}/{action=Default}/{id?}");
            });
            
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Login}/{action=Login}/{id?}");
            });

        }
    }
}
