<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Advanced_Page_10_RowNumber_Function.aspx.cs" Inherits="Book_Sample_Ch14_Advanced_Page_10_RowNumber_Function" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>拉任何一個大型控制項到畫面中，自己寫程式分頁！</title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        您可以拉任何一個大型控制項到畫面中，<br />
        <br />
        並輸入任何一個「大型控制項ID」<br />
        <br />
        protected void <strong>mis2000Lab_Page</strong>(<span class="auto-style1">System.Web.UI.WebControls.BaseDataBoundControl</span> uControl)<br />
        <br />
    
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>


        <br />
        很抱歉，底下兩個 Label還是要自己動手加入！<br />
        <br />


        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br /><br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
