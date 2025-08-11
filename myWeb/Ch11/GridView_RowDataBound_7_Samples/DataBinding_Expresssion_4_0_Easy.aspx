<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataBinding_Expresssion_4_0_Easy.aspx.cs" Inherits="Book_Sample_B06_DataBinding_DataBinding_Expresssion_4_Easy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Student_test學生成績資料表<br />
        <br />
        不及格的出現警告（紅色Label警示文字），比較看看：跟 RowDataBound事件的寫法有何差異？？<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:TemplateField HeaderText="chinese" SortExpression="chinese">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("chinese") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("chinese") %>'></asp:Label>

                        <asp:Label ID="Label2" runat="server" Text="***" style="font-weight: 700; color: #FF0000" 
                             Visible='<%# Convert.ToInt32(Eval("chinese")) < 60 %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFCCFF" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [name], [student_id], [city], [chinese] FROM [student_test]"></asp:SqlDataSource>
    
    </div>
    </form>
    <p>
        1.&nbsp; 轉成樣板以後，放入一個 Label2.Text = &quot;***&quot;</p>
    <p>
        2.&nbsp; 在「資料繫結運算式」裡面，撰寫判別式（傳回true / false）</p>
</body>
</html>
