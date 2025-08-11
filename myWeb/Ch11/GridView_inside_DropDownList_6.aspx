<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_inside_DropDownList_6.aspx.cs" Inherits="Book_Sample_Ch11_GridView_inside_DropDownList_6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #990000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        有三個關聯式的資料表<br />
        透過 <span class="style1">SQL指令的 JOIN</span>之後，就能完成相關功能。<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="student_test的name" SortExpression="name" >
                     <ItemStyle BackColor="#99CCFF" />
                </asp:BoundField>
                <asp:BoundField DataField="student_id" HeaderText="student_test的student_id" 
                    SortExpression="student_id" >
                     <ItemStyle BackColor="#99CCFF" />
                </asp:BoundField>
                <asp:BoundField DataField="city" HeaderText="student_test的city" 
                    SortExpression="city" >
                     <ItemStyle BackColor="#99CCFF" />
                </asp:BoundField>
                <asp:BoundField DataField="student_year" HeaderText="student_class的student_year" SortExpression="student_year" />
                <asp:BoundField DataField="student_class" HeaderText="student_class的student_classr" SortExpression="student_class" />
                <asp:TemplateField HeaderText="student_department的student_department" 
                    SortExpression="student_department">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("student_department") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("student_department") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            SelectedValue='<%# Eval("student_department") %>'>
                                  <asp:ListItem>企管</asp:ListItem>
                                  <asp:ListItem>會計</asp:ListItem>
                                  <asp:ListItem>財金</asp:ListItem>
                                  <asp:ListItem>大傳</asp:ListItem>
                                  <asp:ListItem>電機</asp:ListItem>
                                  <asp:ListItem>圖資</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <ItemStyle BackColor="#CCFF99" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="Select * From student_test a , student_class b, student_department c Where a.student_id = b.student_id and b.sd_id= c.sd_id" >
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>

