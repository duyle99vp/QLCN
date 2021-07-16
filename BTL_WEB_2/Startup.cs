using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BTL_WEB_2.Startup))]
namespace BTL_WEB_2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
