<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_4_Add_Manual.aspx.cs" Inherits="Ch11_Default_book_4_Add_Manual" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>自己寫的 GridView「資料新增」功能</title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
        <strong><span style="color: #006600">從資料庫連結開始，100%都用手寫程式<br />
            ASP.NET 2.0 ---- SqlDataSource版</span></strong><br />
        <br />
        新增資料後，下面的GridView會立即出現新資料。<br />
        title :
        <asp:TextBox ID="TextBox1" runat="server" Width="182px"></asp:TextBox><br />
        class :
        <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
            <asp:ListItem Selected="True">科技</asp:ListItem>
            <asp:ListItem>教育</asp:ListItem>
            <asp:ListItem>政治</asp:ListItem>
            <asp:ListItem>娛樂</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:ListBox><br />
        summary :
        <asp:TextBox ID="TextBox2" runat="server" Width="506px"></asp:TextBox><br />
        article :
        <asp:TextBox ID="TextBox3" runat="server" Height="116px" TextMode="MultiLine" Width="522px"></asp:TextBox><br />
        author :
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        &nbsp; &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Insert Into!"
            OnClick="Button1_Click" /><br />
        <br />
        <hr />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
            Font-Size="X-Small" AllowPaging="True" PageSize="5"
            EnableSortingAndPagingCallbacks="True"
            OnPageIndexChanging="GridView1_PageIndexChanging">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
        </asp:GridView>

    </div>
    </form>

</body>
</html>

