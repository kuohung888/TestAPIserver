<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NamingContainer_FindControl_2.aspx.cs" Inherits="Book_Sample_Ch10_NamingContainer_FindControl_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        .NaminContainer屬性<br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.namingcontainer(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.namingcontainer(v=vs.110).aspx</a>
        <br />
        <br />
        下面兩種作法，造成 .UniqueID的結果不同（上面的GridView，格子的Index數多一）<br />
        <br />
        <br />
        **原始未改GridView**<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label1" runat="server" style="color: #0000FF"></asp:Label>
        <br /><br />
        <asp:Label ID="Label2" runat="server" style="color: #FF0000"></asp:Label>
    </div>

        <hr /><br />
        <br />
        ** 第一欄轉成樣板 **<br />

        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="GridView2_SelectedIndexChanged" PageSize="5"
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:TemplateField ShowHeader="False" HeaderText="本欄已經轉成樣板">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="選取"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFCC99" />
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView> <br />
        <asp:Label ID="Label3" runat="server" style="color: #0000FF"></asp:Label>
        <br /><br />
        <asp:Label ID="Label4" runat="server" style="color: #FF0000"></asp:Label>

        <br />
        <br />
        <asp:Label ID="Label5" runat="server" style="color: #009933"></asp:Label>

    </form>
</body>
</html>
