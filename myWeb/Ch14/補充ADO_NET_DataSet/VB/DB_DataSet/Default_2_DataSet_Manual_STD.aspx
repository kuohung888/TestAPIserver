<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default_2_DataSet_Manual_STD.aspx.vb" Inherits="VS2010_Book_Sample_test_ADO_NET_Default_2_DataSet_Manual_STD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>DataSet ---- Code Behind 完全手寫</title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #FFFF66;
            background-color: #990033;
        }
        .style2
        {
            font-weight: bold;
            background-color: #CCFFFF;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        使用ADO.NET 的 <span style="color: #0033cc; " class="style2">SqlDataAdapter /
            DataSet</span>。<br />
        Code Behind 完全手寫<span class="style1">&nbsp; (這是標準寫法)</span><br />
        ---------------------------------------------------------------------------------<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" Font-Size="Small"
            ForeColor="#333333" GridLines="None" PageSize="5" DataKeyNames="id">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFC0C0" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowDeleteButton="True"/>
            </Columns>
        </asp:GridView>
    
        <br />
        <br />
        務必設定好 GridView的<span class="style3">「DataKeyNames屬性」</span></div>
    </form>
</body>
</html>