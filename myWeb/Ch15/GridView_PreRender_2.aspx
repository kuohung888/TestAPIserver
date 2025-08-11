<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_PreRender_2.aspx.cs" Inherits="Book_Sample_B06_DataBinding_GridView_PreRender2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <p>

        改用 <strong>PreRender事件</strong>來作，在控制項呈現在畫面「<strong>之前</strong>」處理完畢。<br />
    </p>
    <p>
        1. 先在GridView最末端，加入一個空白樣板（TemplateFiled）</p>
    <p>
        2. 在裡面放入一個Label控制項</p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="chinese" HeaderText="chinese" SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
                <asp:TemplateField HeaderText="自己加入的空白樣板（TemplateField）">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #990099"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFCCFF" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>
    <div>
    
    </div>
    </form>
</body>
</html>
