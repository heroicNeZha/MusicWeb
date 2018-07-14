<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SongManage.aspx.cs" Inherits="MusicWeb.Admin.SongManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2 navbar-inverse nav-back">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="../Admin/Welcome.aspx">仪表盘</a></li>
                <li><a href="../Admin/NewSinger.aspx">歌手信息录入</a></li>
                <li class="active"><a href="../Admin/SongManage.aspx">曲目管理</a></li>
                <li><a href="../Admin/SongUpload.aspx">上传歌曲</a></li>
                <li><a href="../Default.aspx">返回前台</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="welcome-container">
                <div class="wel-title">
                    <h3><strong>曲目管理</strong></h3>
                </div>
                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MID" DataSourceID="SqlDataSource1"
                        BackColor="#DDDDDD" BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="1"
                        GridLines="None" Style="line-height: 22px; width: 90%;" AllowPaging="True">
                        <RowStyle BackColor="#ffffff" ForeColor="Black" />
                        <AlternatingRowStyle BackColor="#DDDDDD" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="MID" HeaderText="Index" InsertVisible="False" ReadOnly="True" SortExpression="MID" />
                            <asp:BoundField DataField="Mname" HeaderText="歌名" SortExpression="Mname" />
                            <asp:BoundField DataField="Sname" HeaderText="歌手" SortExpression="Sname" />
                            <asp:BoundField DataField="Malbum" HeaderText="专辑" SortExpression="Malbum" />
                            <asp:BoundField DataField="Mresource" HeaderText="存储地址" SortExpression="Mresource" />
                            <asp:BoundField DataField="Mlenght" HeaderText="长度" SortExpression="Mlenght" />
                            <asp:BoundField DataField="Mclick" HeaderText="点击率" SortExpression="Mclick" />
                            <asp:CommandField ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM music WHERE (MID = @MID)" SelectCommand="SELECT music.MID, music.Mname, singer.Sname,music.Malbum, music.Mresource, music.Mlenght, music.Mclick FROM music INNER JOIN singer ON music.Msinger = singer.SID">
                        <DeleteParameters>
                            <asp:Parameter Name="MID" Type="Int32" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
