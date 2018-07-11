using MusicWeb.Controller;
using MusicWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusicWeb
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = null;
            Session["user"] = null;
            Session["uid"] = null;
            Session["rid"] = null;
        }

        protected void Login(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (DUser.Exist(username.Text))
                {
                    User user = DUser.UserLogin(username.Text, Password.Text);
                    if (user != null)
                    {
                        Session["role"] = "user";
                        Session["user"] = user;
                        Session["uid"] = user.Uid;
                        Response.Write("<script>alert('登录成功!');</script>");
                        Server.Transfer("~/Website/Contact.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('密码不正确!');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('用户名不存在!');</script>");
                }

            }
        }
    }
}