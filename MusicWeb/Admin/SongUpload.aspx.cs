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
    public partial class SongUpload : System.Web.UI.Page
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
            try
            {
                string uploadPicName = InputFile.Value;
                string pictureName = "";
                if (InputFile.Value != "")
                {
                    int idx = uploadPicName.LastIndexOf(".");
                    string suffix = uploadPicName.Substring(idx);
                    pictureName = DateTime.Now.Ticks.ToString() + suffix;
                    string path = Server.MapPath("~/Images/");
                    InputFile.PostedFile.SaveAs(path + pictureName);
                }
                else
                {
                    return;
                }
                string uploadSongName = SongFile.Value;
                string songName = "";
                if (SongFile.Value != "")
                {
                    int idx = uploadSongName.LastIndexOf(".");
                    string suffix = uploadSongName.Substring(idx);
                    songName = DateTime.Now.Ticks.ToString() + suffix;
                    string path = Server.MapPath("~/Audio/");
                    SongFile.PostedFile.SaveAs(path + songName);
                }
                else
                {
                    return;
                }

                Music song = new Music();
                song.Mname = song_name.Value;
                Singer singer = new Singer();
                singer.Sid = Convert.ToInt32(Request.Form["singer_name"]);
                song.Msinger = singer;
                song.Malbum = album.Value;
                song.Mclick = 0;
                song.Mresource = "../Audio/"+songName;
                song.Mpic = "../Images/" + pictureName;

                if (DMusic.InsertSong(song))
                    Response.Write("<script>alert('上传成功!');</script>");
                else
                    Response.Write("<script>alert('上传失败!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}