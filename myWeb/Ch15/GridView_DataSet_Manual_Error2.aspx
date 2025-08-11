<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_DataSet_Manual_Error2.aspx.cs" Inherits="Book_Sample_Ch15_GridView_DataSet_Manual_Error2" %>

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
        .style4
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #0000FF;
        }
        .style5
        {
            color: #0000FF;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        使用ADO.NET 的 <span style="color: #0033cc; " class="style2">SqlDataAdapter /
            DataSet</span>。<br />
        Code Behind 完全手寫<span class="style1">&nbsp; (這是標準寫法)......本範例只作分頁！！</span><br />
        ---------------------------------------------------------------------------------<br />
        <br />
        <span class="style4">改用 Page_PreRender事件</span>，<span class="style5">取代</span> 
        Page_Load事件就OK！<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" Font-Size="Small"
            ForeColor="Black" GridLines="Horizontal" PageSize="5" DataKeyNames="id" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
            BorderWidth="1px" onpageindexchanging="GridView1_PageIndexChanging">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    
        <br />
        <br />
        務必設定好 GridView的<span class="style3">「DataKeyNames屬性」</span></div>
    </form>
</body>
