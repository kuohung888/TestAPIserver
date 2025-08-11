<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Dynamic_Add_Template_0.aspx.cs" Inherits="Ch11_GridView_Dynamic_Add_Template_0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GridView動態增加Template #0</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        GridView後面加上的 Template樣板，是「後置程式碼」<span class="style1">動態加上</span>的
    </p>
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1"
            ForeColor="Black" GridLines="Vertical" AllowPaging="True" PageSize="5"
            OnPageIndexChanging="GridView1_PageIndexChanging">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>
    </p>
    <div>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add GridView's Template" />

    </div>
    </form>

</body>
</html>
