<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_01_Error.aspx.cs" Inherits="Book_Sample_Ch10_test_01_Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .style2
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    GridView「裡面」的子控制項（如Button、DropDownList），如何觸發子控制項的事件？
    <b>#1</b><br />
        <br />
        <span class="style1">錯誤版本</span><span class="style2">，可以從錯誤中發覺到「對」的作法</span><br /><br /><hr /><br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>

                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
                              OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Selected="True">yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>

                        </asp:DropDownList>
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="student_id" HeaderText="student_id" 
                    SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="chinese" HeaderText="chinese" 
                    SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
            SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>
    
    </div>
    
    </form>
</body>
</html>



