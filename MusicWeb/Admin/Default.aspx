<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MusicWeb.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2 navbar-inverse nav-back">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="../Admin/Welcome.aspx">仪表盘</a></li>
                <li><a href="../Admin/NewSinger.aspx">歌手信息录入</a></li>
                <li><a href="../Admin/SongManage.aspx">曲目管理</a></li>
                <li><a href="../Admin/SongUpload.aspx">上传歌曲</a></li>
                <li><a href="../Default.aspx">返回前台</a></li>
            </ul>
        </div>
        <div class="col-md-10 center admin_login">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="username" CssClass="col-md-2 control-label">用户名</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="username" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="username"
                                CssClass="text-danger" ErrorMessage="“用户名”字段是必填字段。" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">密码</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="“密码”字段是必填字段。" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">记住我?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Login" Text="登录" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">注册为新用户</asp:HyperLink>
                </p>
            </section>
        </div>
    </div>
</asp:Content>
