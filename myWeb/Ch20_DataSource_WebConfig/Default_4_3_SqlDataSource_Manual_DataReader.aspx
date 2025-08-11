<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_4_3_SqlDataSource_Manual_DataReader.aspx.cs" Inherits="Ch14_Default_4_3_SqlDataSource_Manual_DataReader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>把SqlDataSource的「DataSourceMode」設定為DataReader</title>
</head>
<body>
     <form id="form1" runat="server">
     <div>
     把SqlDataSource的「DataSourceMode」設定為DataReader
     <hr />
    <p>
        <strong><span style="color: #ff0000">
            除了GridView之外, 其他程式 100%都是手寫的<br />
            <span style="color: #3300ff; text-decoration: underline">
            HTML畫面上，沒有 SqlDataSource</span></span></strong></p>
            
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" Font-Size="Small" 
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <p>&nbsp;</p>

    
    </div>
    </form>
 
</body>
</html>
