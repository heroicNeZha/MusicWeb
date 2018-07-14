<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Rank.aspx.cs" Inherits="MusicWeb.Website.Rank" %>

<%@ Import Namespace="MusicWeb.Controller" %>
<%@ Import Namespace="MusicWeb.Models" %>
<html lang="zh">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - 网难云音乐</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <script type="text/javascript" src="../Scripts/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="~/Content/vpplayer.css">
    <script type="text/javascript" src="../Scripts/vpplayer.js"></script>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--若要了解有关在 ScriptManager 中绑定脚本的详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--框架脚本--%>
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--站点脚本--%>
            </Scripts>
        </asp:ScriptManager>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">网难云音乐</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/Website/Default.aspx?song=1">首页</a></li>
                        <li><a runat="server" href="~/Website/Rank.aspx">排行榜</a></li>
                        <li><a runat="server" href="~/Website/List.aspx">歌单</a></li>
                        <li><a runat="server" href="~/Website/Artist.aspx">歌手</a></li>
                    </ul>
                    <div class="navbar-left navbar-form" role="search">
                        <div class="form-group">
                            <input type="text" id="search" class="form-control" placeholder="音乐/歌手/歌单">
                        </div>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="搜索" />
                    </div>
                    <%if (Session["role"] == null)
                    { %>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a runat="server" href="~/">注册</a></li>
                        <li><a runat="server" href="~/">登录</a></li>
                    </ul>
                    <%}
                        else if (Session["role"].Equals("user"))
                        { %>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a runat="server" href="~/Website/Default.aspx" title="Manage your account">Hello, <strong><%: Session["user"]  %></strong> !</a></li>
                        <li>
                            <a runat="server" href="~/Default.aspx">注销</a>
                        </li>
                    </ul>
                    <%} %>
                </div>
            </div>
        </div>
        <div class="body-content">
            <div style="background-color: black;">
                <div class="container">
                    <div id="myCarousel" class="carousel slide">
                        <!-- 轮播（Carousel）指标 -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="../Images/001.jpg" alt="First slide">
                            </div>
                            <div class="item">
                                <img src="../Images/002.jpg" alt="Second slide">
                            </div>
                            <div class="item">
                                <img src="../Images/003.jpg" alt="Third slide">
                            </div>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                window.onload = function() {
                    var oTable = document.getElementById("rankTable");
                    for ( var i = 1; i < oTable.rows.length; i++) {
                        oTable.rows[i].cells[0].innerHTML = (i);
                    }
                }
            </script>
            <div class="container">
                <div class="rank-title">
                    <h1>
                        <img src="../Images/re.jpg" />
                        网难热歌榜</h1>
                </div>
                <div class="rank-content">
                    <table class="table " id="rankTable">
                        <thead class="tablehead">
                            <tr>
                                <th></th>
                                <th>歌曲</th>
                                <th>歌手</th>
                                <th>专辑</th>
                                <th>点击率</th>
                                <th>时长</th>
                            </tr>
                        </thead>
                        <tbody id="singerSongs">
                            <%
                                List<Music> songs = DMusic.getSongsByRank();
                                foreach (Music song in songs)
                                {
                            %>
                            <tr data-singerid="<%:song.Mid%>">
                                <td></td>
                                <td>
                                    <img class="song-img" src="<%:song.Mpic%>" />
                                    <a class="song" href="Default.aspx?song=<%:song.Mid %>"><span class="glyphicon glyphicon-play-circle"></span> <%:song.Mname %></a>
                                </td>
                                <td><%:song.Msinger.Sname %></td>
                                <td><%:song.Malbum %></td>
                                <td><%:song.Mclick %></td>
                                <td><%:song.Mlength %></td>
                                <td></td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
                <hr />
                <footer>
                    <p>&copy; <%: DateTime.Now.Year %> - 网难云音乐</p>
                </footer>
            </div>
    </form>
</body>
</html>
