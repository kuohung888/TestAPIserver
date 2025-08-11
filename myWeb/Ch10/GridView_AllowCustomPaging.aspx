<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_AllowCustomPaging.aspx.cs" Inherits="Book_Sample_Ch10_GridView_AllowCustomPageing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>AllowPaging 與 AllowCustomPaging</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    資料來源：<a href="http://www.c-sharpcorner.com/UploadFile/99bb20/custom-paging-with-gridview-control-in-Asp-Net-4-5/">http://www.c-sharpcorner.com/UploadFile/99bb20/custom-paging-with-gridview-control-in-Asp-Net-4-5/</a><br />
        （連過去會下載一個.js檔，可能有病毒，請不要安裝或是下載）<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" 
             AllowCustomPaging="True" AllowPaging="True" PageSize="5"            
             OnPageIndexChanging="GridView1_PageIndexChanging">

            <PagerSettings Mode="Numeric" />

        </asp:GridView>

    </div>
    <p class="auto-style1">
        請啟動 AllowPaging 與 AllowCustomPaging</p>
        <p class="auto-style1">
            而且要自己動手寫GridView的分頁樣板&nbsp; &lt;PagerSettings Mode=&quot;NextPrevious&quot;&gt;</p>
        <hr />
        <p class="auto-style1">
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="5">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>
        </p>
    </form>
    </body>
</html>
