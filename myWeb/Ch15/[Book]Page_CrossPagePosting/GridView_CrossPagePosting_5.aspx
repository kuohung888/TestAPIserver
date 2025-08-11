<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_CrossPagePosting_5.aspx.cs" Inherits="Book_Sample_Ch15__Book_Page_CrossPagePosting_GridView_CrossPagePosting_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>第三組（範例 5 / 6 ）</title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FF99FF;
        }
    </style>
</head>
<body>
    <p>
        本範例需要用到
    </p>
    <p>
        1.&nbsp; 跨網頁張貼
    </p>
    <p>
        2. GridView的 <strong>CommandName</strong>與<strong>流水號</strong>（<a href="http://www.dotblogs.com.tw/mis2000lab/archive/2011/11/05/gridview_container_dataitemindex.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2011/11/05/gridview_container_dataitemindex.aspx</a>）<br />
    </p>
    <p>
        <strong><span class="auto-style1">改用 Session來做，更簡單！</span></strong>&nbsp;
    </p>
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="test_time" SortExpression="test_time">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox_test_time" runat="server" Text='<%# Bind("test_time") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="title" SortExpression="title">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox_title" runat="server" Width="450px" Text='<%# Bind("title") %>'></asp:TextBox>
                            <br />
                            <asp:Button ID="Button1" runat="server" CommandName="myLINK"
                                CommandArgument='<%# Container.DataItemIndex %>'
                                Text="Button_連到新網頁做修改_CommandName=myLINK，已設定「流水號」" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title]) VALUES (@test_time, @title)" SelectCommand="SELECT [id], [test_time], [title] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="test_time" Type="DateTime" />
                    <asp:Parameter Name="title" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="test_time" Type="DateTime" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <div>
            本範例可以搭配 <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2012/01/13/gridview_multi_row_updating_20120113.aspx"><strong>&nbsp;[MSDN][轉貼] GridView &quot;批次&quot;執行更新與刪除、執行 &quot;大量&quot;更新更新與刪除<br />
            </strong>&nbsp;<strong>http://www.dotblogs.com.tw/mis2000lab/archive/2012/01/13/gridview_multi_row_updating_20120113.aspx</strong></a><br />
            <br />
            範例 Gridview_Multi_Edit.aspx
        </div>
    </form>
</body>
</html>
