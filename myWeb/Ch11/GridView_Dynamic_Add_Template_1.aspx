<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Dynamic_Add_Template_1.aspx.cs" Inherits="Ch11_GridView_Dynamic_Add_Template_1" %>

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
        .style2
        {
            color: #009900;
            font-size: small;
        }
        .style3
        {
            color: #000099;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        GridView後面加上的 Template樣板，是「後置程式碼」<span class="style1">動態加上</span>的
    </p>
    <p>
        <a href="http://msdn.microsoft.com/zh-tw/library/cc438020(VS.71).aspx">http://msdn.microsoft.com/zh-tw/library/cc438020(VS.71).aspx</a>
    </p>
    <p>
        本程式的特點：
    </p>
    <ul>
        <li>1.&nbsp; 動態產生的 Template樣板「列數」，可以自選</li>
        <li>2.&nbsp; 防範重複按下「Add」按鍵，會引發的錯誤狀況。（下一隻程式可解）</li>
        <li>3.&nbsp; 分頁、測試Button將會引發 PostBack，讓新增的樣板列失效！（下一隻程式可解）</li>
    </ul>
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px"
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1"
            ForeColor="Black" AllowPaging="True" PageSize="5"
            OnPageIndexChanging="GridView1_PageIndexChanging" BorderStyle="Solid"
            CellSpacing="2">
            <RowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black"
                HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#000099" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>
    </p>
    <br />

    &nbsp;<span class="style3">增加幾列Template：</span>
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
        <asp:Button ID="Button2" runat="server" Text="測試用的Button" />

        &nbsp; <span class="style1">&lt;==缺點！！</span><span class="style2">動態新增的Template樣板列，會因為其他控制項引發的 <b>PostBack</b>而消失....</span>
    </div>
    </form>

</body>
</html>
