<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_GridView_Light_3A_JavaScript_Select.aspx.cs" Inherits="Book_Sample_Ch07_Default_book_GridView_Light_3A_JavaScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>錯誤版，不會動</title>
    <style type="text/css">
        .style1 {
            background-color: #FFFF00;
        }
        .style2
        {
            color: #CC0000;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h3>錯誤版，不會動</h3>


    <form id="form1" runat="server">
    <div>
        動態加入「光棒效果」的 JavaScript程式到 GridView<span class="style3">每一列</span>裡面。<br />
        <b>使用GridView的 <span class="style1">RowDataBound事件</span></b><br />
        <br />
        網友發問：想要加入<strong>「選取」按鈕</strong>，但是會跟 JavaScript特效衝突，該怎麼處理？<br />
        解決方法「e.Row.<b><span class="style1">RowState</span></b>」<br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" OnRowCreated="GridView1_RowCreated">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"></asp:BoundField>
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author"></asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle ForeColor="#333333" />
            <SelectedRowStyle BackColor="Green" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title], [author] FROM [test]" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([title], [author]) VALUES (@title, @author)" UpdateCommand="UPDATE [test] SET [title] = @title, [author] = @author WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        ===================================================================<br />
        對照組（尚未修改以前）<br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" OnRowDataBound="GridView2_RowDataBound">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"></asp:BoundField>
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author"></asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle ForeColor="#003399" BackColor="White" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <br />
    </div>
    </form>
</body>
</html>
