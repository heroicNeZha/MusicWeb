using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MusicWeb.Startup))]
namespace MusicWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
        }
    }
}
