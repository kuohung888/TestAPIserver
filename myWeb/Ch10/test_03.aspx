<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_03.aspx.cs" Inherits="Book_Sample_Ch10_test_03" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #990099;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style3
        {
            background-color: #990099;
        }
        .auto-style1 {
            color: #FFFF00;
            font-weight: bold;
            background-color: #990099;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    GridView「裡面」的子控制項（如Button、DropDownList），如何觸發子控制項的事件？<b>#3</b><br />
        <br />
        上一個範例有一些<span class="style2">缺點</span>：<br />
        (1). 必須先按下Gridview的「選取」按鈕才能動作，不能直接按下自訂的按鈕<br />
        (2). 使用 Session來紀錄 GridView被點選的那一列（RowIndex）<br />
        <br />
        <br />
        增加<span class="style3"> </span> 
        <span class="style1">自己設定的 Button按鈕 ，設定 CommandArgument為 </span> 
        <span class="auto-style1">&lt;%# Container.DataItemIndex %&gt;</span><br />
        <br /><hr /><br />
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" onrowcommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>

                        <asp:DropDownList ID="DropDownList1" runat="server" >
                            <asp:ListItem>yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button ID="Button1" runat="server" Text="自訂按鈕，Button" 
                                CommandArgument='<%# Container.DataItemIndex %>' />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="student_id" HeaderText="student_id" 
                    SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="chinese" HeaderText="chinese" 
                    SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle ForeColor="Black" BackColor="#EEEEEE" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
            SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>
    
    </div>
    
    </form>
</body>
</html>
