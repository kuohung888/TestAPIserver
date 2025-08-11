<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06_DropDownList_AppendDataBoundItems.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_6_DropDownList_AppendDataBoundItems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FFCC99;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        透過 <span class="style1">AppendDataBoundItems屬性 = True</span>，增加新的子項目<br />
        <br />
        &nbsp;&nbsp;&nbsp; 首先，手動加入一個子選項，名為「<b>請選擇----</b>」<br />
        &nbsp;&nbsp;&nbsp; 後續的子選項，則是由 SqlDataSource<span class="style2">動態</span>加入。<br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1"
            DataTextField="title" DataValueField="id">
            <asp:ListItem>請選擇----</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
