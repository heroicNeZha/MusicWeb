<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="NewSinger.aspx.cs" Inherits="MusicWeb.Admin.NewSinger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2 navbar-inverse nav-back">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="../Admin/Welcome.aspx">仪表盘</a></li>
                <li class="active"><a href="../Admin/NewSinger.aspx">歌手信息录入</a></li>
                <li><a href="../Admin/SongManage.aspx">曲目管理</a></li>
                <li><a href="../Admin/SongUpload.aspx">上传歌曲</a></li>
                <li><a href="../Default.aspx">返回前台</a></li>
            </ul>
        </div>
        <div class="col-md-6">
            <div class="singer-div">
                <div class="singer-item">
                    <h4>歌手名</h4>
                    <input id="singer_name" runat="server" class="form-control" type="text">
                </div>
                <div class="singer-item">
                    <h4>歌手简介</h4>
                    <textarea id="singer_details" runat="server" class="form-control" style="height: 400px; width: 80%;"></textarea>
                </div>
                <div class="singer-item">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="确认" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div>
                <%--<input id="InputFile" type="file" style="display: none">--%>
                <img id="photo-display" src="../Images/photo.jpg" />
                <div class="find-file">
                    <input type="text" id="text1" readonly="readonly" class="text_1" />
                    <a href="javascript:;" class="a-upload">
                        <input type="file" runat="server" id="InputFile" autocomplete="off" accept="image/*" onchange="fileChange(this,'text1');" style="width: 70px;" />浏览 
                    </a>
                    <script type="text/javascript">
                     function fileChange(p, v) {
                         if (p != null && v != null) {
                             var va = document.getElementById(v);
                             va.value = p.value;
                             va.focus();
                         }
                     }
                    </script>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
