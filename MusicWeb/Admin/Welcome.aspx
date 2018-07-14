<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="MusicWeb.Admin.Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2 navbar-inverse nav-back">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="../Admin/Welcome.aspx">仪表盘</a></li>
                <li><a href="../Admin/NewSinger.aspx">歌手信息录入</a></li>
                <li><a href="../Admin/SongManage.aspx">曲目管理</a></li>
                <li><a href="../Admin/SongUpload.aspx">上传歌曲</a></li>
                <li><a href="../">返回前台</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="welcome-container">
                <div class="wel-title">
                    <h3><strong>歌手列表</strong></h3>
                </div>
                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SID" DataSourceID="SqlDataSource1"
                        BackColor="#DDDDDD" BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="1"
                        GridLines="None" Style="line-height: 22px; width: 90%;" AllowPaging="True">
                        <RowStyle BackColor="#ffffff" ForeColor="Black" />
                        <AlternatingRowStyle BackColor="#DDDDDD" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="SID" HeaderText="Index" InsertVisible="False" ReadOnly="True" SortExpression="SID" />
                            <asp:BoundField DataField="Sname" HeaderText="歌手" SortExpression="Sname" />
                            <asp:BoundField DataField="Sintroduce" HeaderText="介绍" SortExpression="Sintroduce">
                                <ItemStyle Width="70%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Spic" HeaderText="Spic" SortExpression="Spic" Visible="False" />
                            <asp:CommandField ShowDeleteButton="true" />
                            <asp:CommandField ShowEditButton="true" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [singer] WHERE [SID] = @SID" InsertCommand="INSERT INTO [singer] ([Sname], [Sintroduce], [Spic]) VALUES (@Sname, @Sintroduce, @Spic)" SelectCommand="SELECT * FROM [singer]" UpdateCommand="UPDATE [singer] SET [Sname] = @Sname, [Sintroduce] = @Sintroduce, [Spic] = @Spic WHERE [SID] = @SID">
                        <DeleteParameters>
                            <asp:Parameter Name="SID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Sname" Type="String" />
                            <asp:Parameter Name="Sintroduce" Type="String" />
                            <asp:Parameter Name="Spic" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Sname" Type="String" />
                            <asp:Parameter Name="Sintroduce" Type="String" />
                            <asp:Parameter Name="Spic" Type="String" />
                            <asp:Parameter Name="SID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="wel-title">
                    <h3>歌曲列表</h3>
                </div>
                <div>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="MID" DataSourceID="SqlDataSource2"
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM music WHERE (MID = @MID)" SelectCommand="SELECT music.MID, music.Mname, singer.Sname,music.Malbum, music.Mresource, music.Mlenght, music.Mclick FROM music INNER JOIN singer ON music.Msinger = singer.SID">
                        <DeleteParameters>
                            <asp:Parameter Name="MID" Type="Int32" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    </asp:Content>
