<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_4_1_SqlDataSource.aspx.cs" Inherits="Book_Sample_Ch14_Default_4_1_SqlDataSource" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            background-color: #FFFF00;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
            background-color: #FFFF00;
        }
        .style3
        {
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style3">SqlDataSource</span>，自己寫程式<br /><br>
                
        SqlDataSource雖然拉進畫面裡，但沒有寫SQL指令在內。<br />
        也<span class="style2">沒有</span>跟 GridView進行資料繫結，也<b><span class="style1">沒有</span>設定 GridView的「DataSourceID」屬性<br />
        </b><br />
        
        <hr>
        <br />
        
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" Font-Size="Small" 
            ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="5">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        
        

    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server">
    </asp:SqlDataSource>
    </form>
</body>
</html>
