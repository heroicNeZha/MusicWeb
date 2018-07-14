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
    public partial class NewSinger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Admin/");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string uploadName = InputFile.Value;
          //string uploadName = InputFile.PostedFile.FileName; 
            string pictureName = "";
            if (InputFile.Value != "")
            {
                int idx = uploadName.LastIndexOf(".");
                string suffix = uploadName.Substring(idx);
                pictureName = DateTime.Now.Ticks.ToString() + suffix;
            }
            try
            { 
                if (uploadName != "")
                {
                    string path = Server.MapPath("~/Images/");
                    InputFile.PostedFile.SaveAs(path + pictureName);

                    Singer singer = new Singer();
                    singer.Spic = "../Images/" + pictureName;
                    singer.Sname = singer_name.Value;
                    singer.Sintroduce = singer_details.Value;

                    if (DSinger.InsertSinger(singer))
                        Response.Write("<script>alert('录入成功!');</script>");
                    else
                        Response.Write("<script>alert('录入失败!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}