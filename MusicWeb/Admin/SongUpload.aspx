<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SongUpload.aspx.cs" Inherits="MusicWeb.Admin.SongUpload" %>
<%@ Import Namespace="MusicWeb.Controller" %>
<%@ Import Namespace="MusicWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2 navbar-inverse nav-back">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="../Admin/Welcome.aspx">仪表盘</a></li>
                <li><a href="../Admin/NewSinger.aspx">歌手信息录入</a></li>
                <li><a href="../Admin/SongManage.aspx">曲目管理</a></li>
                <li class="active"><a href="../Admin/SongUpload.aspx">上传歌曲</a></li>
                <li><a href="../Default.aspx">返回前台</a></li>
            </ul>
        </div>
        <div class="col-md-6">
            <div class="singer-div">
                <div class="singer-item">
                    <h4>歌名</h4>
                    <input id="song_name" runat="server" class="form-control" type="text">
                </div>
                <div class="singer-item">
                    <h4>歌手</h4>
                    <select id="singer_name" name="singer_name" class="form-control" style="width: 280px;">
                        <%
                            List<Singer> singers = DSinger.getSingers();
                            foreach (Singer singer in singers)
                            {
                             %>
                        <option value="<%:singer.Sid %>""><%:singer.Sname %></option>
                        <%} %>
                    </select>
                </div>
                <div class="singer-item">
                    <h4>专辑</h4>
                    <input id="album" runat="server" class="form-control" type="text">
                </div>
                <div class="singer-item">
                    <h4>选择歌曲文件</h4>
                    <div class="find-file">
                        <input type="text" id="text2" readonly="readonly" class="text_1" /> 
                        <a href="javascript:;" class="a-upload">
                            <input type="file" runat="server" id="SongFile" autocomplete="off" accept="audio/*" onchange="fileChange(this,'text2');" style="width: 70px;" /><span class="glyphicon glyphicon-folder-open"></span> 浏览 
                        </a>
                    </div>
                </div>
                <div class="singer-item">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="上传" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div>
                <img id="photo-display" src="../Images/photo.jpg" />
                <div class="find-file">
                    <input type="text" id="text1" readonly="readonly" class="text_1" /> 
                    <a href="javascript:;" class="a-upload">
                        <input type="file" runat="server" id="InputFile" autocomplete="off" accept="image/*" onchange="fileChange(this,'text1');" style="width: 70px;" /><span class="glyphicon glyphicon-folder-open"></span> 浏览 
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
