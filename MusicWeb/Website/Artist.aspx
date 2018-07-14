<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="MusicWeb.Website.Artist" %>
<%@ Import Namespace="MusicWeb.Controller" %>
<%@ Import Namespace="MusicWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <table class="artist-list table table-striped ">
            <thead class="tablehead">
                <tr>
                    <th></th>
                    <th>歌手</th>
                    <th>简介</th>
                </tr>
            </thead>
            <tbody id="singerSongs">
                <%
                    List<Singer> singers = DSinger.getSingers();
                    foreach (Singer singer in singers)
                    {
                     %>
            <tr data-singerid="<%:singer.Sid%>">
                <td><img class="singer-img" src="<%:singer.Spic%>" /></td>
                <td style="width:80px"><a class="song" href="Singer.aspx?singer=<%:singer.Sid %>"><%:singer.Sname %></a></td>
                <td><%:singer.Sintroduce.Length>51?(singer.Sintroduce.Substring(0,50)+"..."):singer.Sintroduce.Substring(0,singer.Sintroduce.Length-1)%></td>
            </tr>
                <%} %>
            </tbody>
        </table>
        </div>
</asp:Content>
