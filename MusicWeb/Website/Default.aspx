<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MusicWeb.Website.Default" %>

<%@ Import Namespace="MusicWeb.Controller" %>
<%@ Import Namespace="MusicWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">

        <div class="back-area col-md-9">
            <%
                    if(Request.QueryString["song"]!=null)
                    {
                        int mid = Convert.ToInt32(Request.QueryString["song"]);
                        Music music = DMusic.getSongByID(mid);
            %>
            <script>
$(document).ready(function(){
	$("#player").vpplayer({
		src: "<%: music.Mresource%>",
	    trackName: "<%: music.Mname%>",
	    preloadMessage: "LOADING...",
	    view: "minimal",
	    playerColor: "#f4f6f9",
	    displayColor: "red,#f4f6f9"
	});
});
            </script>
            <div class="cover-area">
                <style>
                    .pic-blur{
                        background-image:url(<%:music.Mpic %>);
                    }
                </style>
                <div id="pic-blur" class="pic-blur">
                    <div class="blur-ad"></div>
                </div>
                <div id="music-content">
                    <div id="mcontent-left">
                        <img id="song-pic" src="<%:music.Mpic %>">
                    </div>
                    <div id="mcontent-right">
                        <div class="music-details">
                            <h2><span class="glyphicon glyphicon-music"></span> <%:music.Mname %></h2>
                            <h5>歌手: <a class="song" href="Default.aspx?song=<%:music.Mid %>"><%:music.Msinger.Sname %></a></h5>
                            <h5>专辑: <a class="song" href="Artist.aspx?singer=<%:music.Msinger.Sid %>"><%:music.Malbum %></a></h5>
                            <button ID="Button1" class="btn btn-primary" ><span class="	glyphicon glyphicon-play"></span> 播放</button>
                            <button ID="Button2" class="btn btn-default" ><span class="glyphicon glyphicon-download-alt"></span> 下载</button>
                        </div>
                        
                        <div id="lyc-content">
                            暂无歌词
                        </div>
                    </div>
                </div>
            </div>
            <div class="play-area">
                <div id="player"></div>
            </div>
            
            <%
                    }
            %>
        </div>
        <div class="col-md-3">
            <div>
                <div class="usersonglist">
                    <div class="user-part">
                        <%
                            User user = new User();
                            if (Session["user"] != null)
                                user = (User)Session["user"];
                        %>
                        <img src="<%:user.Upic %>">
                        <div class="user-details">
                            <h4><%:user.Uname %><br>
                                <br>
                                Lv.1</h4>
                        </div>
                    </div>
                    <div class="songlist-title">播放列表</div>
                    <%
                        List<Music> songs = DMusic.getSongs();
                        foreach(Music song in songs)
                        {
                    %>
                    <div class="songlist-item">
                        <img src="<%:song.Mpic %>" alt="">
                        <h6>
                            <a class="song" href="Default.aspx?song=<%:song.Mid %>"><%:song.Mname %></a>
                            <br>
                            <span>
                                <a class="artist" href="Singer.aspx?singer=<%:song.Msinger.Sid %>"><%:song.Msinger.Sname %></a>
                            </span>
                        </h6>
                    </div>
                    <%
                        }
                    %>
                    <div class="songlist-item">
                        <img src="../Images/0.jpg" alt="">
                        <h6>
                            <a class="song">蜗牛与黄鹂鸟</a>
                            <br />
                            <span>
                                <a class="artist">李志</a>
                            </span>
                        </h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
