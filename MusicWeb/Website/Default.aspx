<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MusicWeb.Website.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
      audiojs.events.ready(function() {
        var as = audiojs.createAll();
      });
    </script>
    <audio src="../Audio/追梦赤子心.mp3" preload="auto" />
</asp:Content>
