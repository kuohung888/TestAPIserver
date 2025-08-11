<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_DataSet_Manual_Error1.aspx.cs" Inherits="Book_Sample_Ch15_GridView_DataSet_Manual_Error1" %>

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
            background-color: #CC0000;
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
        <span class="style4">錯誤範例</span>，在Page_Load事件裡面，<span class="style3">沒有</span>寫 
        If判別式，判別式否第一次執行？<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" Font-Size="Small"
            ForeColor="#333333" GridLines="None" PageSize="5" DataKeyNames="id" 
            onpageindexchanging="GridView1_PageIndexChanging">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFC0C0" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    
        <br />
        <br />
        務必設定好 GridView的<span class="style3">「DataKeyNames屬性」</span></div>
    </form>
</body>
</html>
