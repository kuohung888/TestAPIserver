<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_4_2_SqlDataSource_Exception.aspx.cs" Inherits="Book_Sample_Ch14_Default_4_2_SqlDataSource_Exception" %>

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
        .style4
        {
            color: #FF0000;
        }
    </style>
</head>
<body>


<br /><br /><br />
    <form id="form1" runat="server">
    <div>
    
        <span class="style3">SqlDataSource的<span class="style4">例外狀況</span></span>（自己寫程式控制）<br /><br />
        
        <br />
        SqlDataSource雖然拉進畫面裡，但沒有寫SQL指令在內。<br />
        也<span class="style2">沒有</span>跟 GridView進行資料繫結，也<b><span class="style1">沒有</span>設定 GridView的「DataSourceID」屬性<br />
        </b>
        <hr />
        <br />
        
        <asp:GridView ID="GridView1" runat="server" CellPadding="3" Font-Size="Small" 
            GridLines="Horizontal" AllowPaging="True" PageSize="5" BackColor="White" 
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    
    </div>
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        onselected="SqlDataSource1_Selected">
    </asp:SqlDataSource>
    
    
    </form>
 
 
</body>
</html>

