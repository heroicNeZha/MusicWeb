using MusicWeb.Controller;
using MusicWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusicWeb.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = null;
            Session["user"] = null;
            Session["uid"] = null;
        }

        protected void Login(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (DUser.Exist(username.Text))
                {
                    User user = DUser.AdminLogin(username.Text, Password.Text);
                    if (user != null)
                    {
                        Session["role"] = "admin";
                        Session["user"] = user;
                        Response.Write("<script>alert('登录成功!');</script>");
                        Server.Transfer("~/Admin/Welcome.aspx");
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