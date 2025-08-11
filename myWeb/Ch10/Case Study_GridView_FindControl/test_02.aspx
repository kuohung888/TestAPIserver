<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_02.aspx.cs" Inherits="Book_Sample_Ch10_test_02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #0000FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    GridView「裡面」的子控制項（如Button、DropDownList），如何觸發子控制項的事件？<b>#2</b><br />
        <br />
        增加 
        <span class="style1">GridView的 選取（Select）按鈕</span><br />
        <br /><hr /><br />
        1). 請您先點選一列。<br />
        2). 然後再來選取這一列的 DropDownList子選項。
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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

                        <asp:Button ID="Button1" runat="server" Text="自訂Button" 
                                 OnClick="Button1_Click" />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="student_id" HeaderText="student_id" 
                    SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="chinese" HeaderText="chinese" 
                    SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
            SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>
    
    </div>
    
    </form>
</body>
</html>
