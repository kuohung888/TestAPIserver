<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Dynamic_Add_Template_2.aspx.cs" Inherits="Ch11_GridView_Dynamic_Add_Template_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GridView動態增加Template #1</title>
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
    <br />
    <br />

    &nbsp;增加幾列Template：
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>

    &nbsp;&nbsp;<asp:Button ID="Button1" runat="server"
        Text="Add GridView's Template" OnClick="Button1_Click" />
    <div>
        <br />
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="測試用的Button"
            OnClick="Button2_Click" />

        <br />
        本程式改進了「<span class="style2">動態新增的Template樣板列，會因為其他控制項引發的 <b>PostBack</b>而消失....</span><span
            class="style3">」的缺點<br />
            任何一個控制項，都需要啟用Add_TF() 這個自訂函數。&nbsp; 去引發「GridView動態新增的樣板列」</span>
    </div>
    </form>

</body>
</html>
