<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Singer.aspx.cs" Inherits="MusicWeb.Website.Singer" %>

<%@ Import Namespace="MusicWeb.Controller" %>
<%@ Import Namespace="MusicWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <%
            if (Request.QueryString["singer"] != null)
            {
                int sid = Convert.ToInt32(Request.QueryString["singer"]);
                Singer singer = DSinger.getSingerByID(sid);
        %>
        <style>
                    .SingerDetails-bg{
                        background-image:url(<%:singer.Spic %>);
                    }
                </style>
        <div class="SingerDetails row SingerContent">
            <div class="SingerDetails-bg"></div>
            <div class="Singer-pic col-md-4">
                <img src="<%:singer.Spic%>" alt="musiclistpic" class="rounded">
            </div>
            <div class="Singer-details col-md-8">
                <ul>
                    <li>
                        <h4>
                            <%:singer.Sname %>
                        </h4>
                    </li>
                    <li>歌手歌曲总数: 1
                        <button type="button" class="btn btn-primary play-all"><span class="glyphicon glyphicon-play"></span>播放全部</button></li>
                    <li>
                        <%:singer.Sintroduce %>
                    </li>
                </ul>
            </div>
        </div>
        <div class="songlist SingerContent">
            <table class="songlist-table table table-striped ">
                <thead class="tablehead">
                    <tr>
                        <th></th>
                        <th>歌曲</th>
                        <th>歌手</th>
                        <th>专辑</th>
                        <th>时长</th>
                    </tr>
                </thead>
                <tbody id="singerSongs">
                    <%
                    List<Music> songs = DMusic.getSongsBySinger(singer.Sid);
                    foreach (Music song in songs)
                    {
                    %>
                    <tr data-singerid="<%:song.Mid%>">
                        <td>
                            <img class="song-img" src="<%:song.Mpic%>" /></td>
                        <td><a class="song" href="Default.aspx?song=<%:song.Mid %>"><%:song.Mname %></a></td>
                        <td><%:song.Msinger.Sname %></td>
                        <td><%:song.Malbum %></td>
                        <td><%:song.Mlength %></td>
                        <td></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>

            <%} %>
        </div>
    </div>
</asp:Content>
