<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>日月光半導體多站點工單查詢系統</title>
    <link href="Styles/site.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
        // jQuery 用於UI美化與互動
        $(document).ready(function () {
            // 例如：可加載時做些動作
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>多站點工單查詢系統</h2>

           <asp:Panel ID="pnlFilters" runat="server" CssClass="filter-panel">
    客戶編號:
    <asp:DropDownList ID="ddlCustomerCode" runat="server" CssClass="filter-input" AppendDataBoundItems="true">
        <asp:ListItem Text="全部" Value="" />
    </asp:DropDownList>

    工單號:
    <asp:TextBox ID="txtWorkOrderNumber" runat="server" CssClass="filter-input" />

    站點代號:
    <asp:DropDownList ID="ddlWorkstationCode" runat="server" CssClass="filter-input" AppendDataBoundItems="true">
        <asp:ListItem Text="全部" Value="" />
    </asp:DropDownList>

    機台編號:
    <asp:DropDownList ID="ddlMachineCode" runat="server" CssClass="filter-input" AppendDataBoundItems="true">
        <asp:ListItem Text="全部" Value="" />
    </asp:DropDownList>

    工單日期起:
    <asp:TextBox ID="txtDateFrom" runat="server" CssClass="filter-input" />

    工單日期迄:
    <asp:TextBox ID="txtDateTo" runat="server" CssClass="filter-input" />

    工單狀態:
    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-input">
        <asp:ListItem Text="全部" Value="" />
        <asp:ListItem Text="派工中" Value="派工中" />
        <asp:ListItem Text="已完成" Value="已完成" />
        <asp:ListItem Text="暫停" Value="暫停" />
        <asp:ListItem Text="已取消" Value="已取消" />
    </asp:DropDownList>

    <asp:Button ID="btnSearch" runat="server" Text="查詢" CssClass="btn-search" OnClick="btnSearch_Click" />
</asp:Panel>


            <asp:GridView ID="gvWorkOrders" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                PageSize="20" OnPageIndexChanging="gvWorkOrders_PageIndexChanging" OnSorting="gvWorkOrders_Sorting" CssClass="gridview">
                <Columns>
                    <asp:HyperLinkField DataTextField="WorkOrderNumber" HeaderText="工單號" SortExpression="WorkOrderNumber"
            DataNavigateUrlFields="WorkOrderNumber" DataNavigateUrlFormatString="Detail.aspx?workOrderNumber={0}" />
                    <asp:BoundField DataField="CustomerCode" HeaderText="客戶編號" SortExpression="CustomerCode" />
                    <asp:BoundField DataField="WorkstationCode" HeaderText="站點代號" SortExpression="WorkstationCode" />
                    <asp:BoundField DataField="MachineCode" HeaderText="機台編號" SortExpression="MachineCode" />
                    <asp:BoundField DataField="WorkOrderDate" HeaderText="工單日期" DataFormatString="{0:yyyy-MM-dd}" SortExpression="WorkOrderDate" />
                    <asp:BoundField DataField="Status" HeaderText="工單狀態" SortExpression="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
