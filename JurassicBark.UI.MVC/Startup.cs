using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JurassicBark.UI.MVC.Startup))]
namespace JurassicBark.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
