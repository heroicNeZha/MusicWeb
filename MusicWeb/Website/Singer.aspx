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
        
        <%} %>
        </div>
</asp:Content>
