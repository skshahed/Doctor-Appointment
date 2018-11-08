using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DoctorAppointment.Startup))]
namespace DoctorAppointment
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
