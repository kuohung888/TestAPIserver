<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_2_DataSet_Manual_Error1.aspx.cs" Inherits="Ch10_Default_2_DataSet_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>**���~�d��**</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>**���~�d��**</h3>
        <span class="auto-style1"><strong>���U�u�s��v�u�����v���ݭn���⦸�~�ʧ@
        </strong></span>
        <br /><br />

        �ϥ�ADO.NET �� <span style="color: #0033cc; background-color: #ffff33">SqlDataAdapter /
            DataSet</span>�C<br />
        Code Behind ������g
        <br />
        ---------------------------------------------------------------------------------<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" Font-Size="Small"
            ForeColor="#333333" GridLines="None" PageSize="5" DataKeyNames="id"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />

            </Columns>
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

        <br />
        <br />

    </div>
        <p>
            &nbsp;</p>

    </form>

</body>
</html>
