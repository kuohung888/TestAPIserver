<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_4_SqlDataSource_Manual_DataBinding.aspx.cs" Inherits="Ch14_Default_4_SqlDataSource_Manual_DataBinding" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF3300;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        請輸入文章編號 id =
        <asp:TextBox ID="TextBox1" runat="server" Width="43px"></asp:TextBox>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None">
            <RowStyle BackColor="#E3EAEB" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </p>
    <div>
        本畫面 <span class="style1">沒有</span> SqlDataSource，必須自己動手撰寫在 Code Behind
    </div>
    </form>
</body>
</html>

