<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>工單詳細資訊</title>
    <link href="Styles/site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>工單詳細資訊</h2>
            <asp:Panel ID="pnlDetail" runat="server" CssClass="detail-panel">
                <asp:Label ID="lblWorkOrderNumber" runat="server" Text="工單號：" CssClass="label-title"></asp:Label><br />
                <asp:Label ID="lblEmployeeName" runat="server" Text="負責員工：" CssClass="label-title"></asp:Label><br />
                <asp:Label ID="lblEmployeePosition" runat="server" Text="職稱：" CssClass="label-title"></asp:Label><br />
                <asp:Label ID="lblEmployeePhone" runat="server" Text="聯絡電話：" CssClass="label-title"></asp:Label><br />
                <asp:Button ID="btnBack" runat="server" Text="返回列表" OnClick="btnBack_Click" CssClass="btn-search" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
