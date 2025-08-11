<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_2_DataSet_Manual.aspx.cs" Inherits="Ch10_Default_2_DataSet_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DataSet ---- Code Behind 完全手寫</title>
    <style type="text/css">
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
        使用ADO.NET 的 <span style="color: #0033cc; background-color: #ffff33">SqlDataAdapter /
            DataSet</span>。<br />
        Code Behind 完全手寫
        <br />
        ---------------------------------------------------------------------------------<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" Font-Size="Small"
            ForeColor="#333333" GridLines="None" PageSize="5" DataKeyNames="id"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating">
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
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <br />
        <br />

    </div>
        <p>
            &nbsp;</p>

    </form>

</body>
</html>
