<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Get_Index_PK.aspx.cs" Inherits="Ch10_Get_Index_PK" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>擷取GridView的列數、PK值的各種方法</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            color: #006666;
        }
        .style3
        {
            background-color: #FFFF66;
        }
        .style4
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" 
            PageSize="5" onrowcommand="GridView1_RowCommand" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onselectedindexchanging="GridView1_SelectedIndexChanging">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
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
        <br />
        用各種方法，來抓取 GridView的列數、資料表的PK值<br />
        <br />
        重點--<span class="style2">GridView.<b>SelectedIndex</b> 與 GridView.<b>SelectedValue</b></span><br 
            class="style2" />&nbsp;&nbsp;&nbsp; 寫在 GridView1_SelectedChang<span 
            class="style3"><b>ed()</b>事件</span>裡面才行ass="style3">ed()事件</span>裡面才行<br如果您把 GridView.SelectedIndex與 GridView.SelectedValue寫在其他事件（如GridView的 
        RowCommand()與 SelectedIndexChanging()事件內），在</span><span class="style4">第一次執行時n><span class="style4">第一次執行，都會衍生一些怪現象<br />
        </span>
        <br />
        <br />重點--an><br />
        <br />
        重點--<span class="style1">在GridView1_RowCommand()裡面，如何獲得這一列的資料表PK值？</span></div>
    </form>
 
</body>
</html>
