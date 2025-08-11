<%@ Page Language="C#" AutoEventWireup="true" CodeFile="db_user_2_Enable_Time.aspx.cs" Inherits="Book_Sample_B12_Member_Login_Session_db_user_2_Enable_Time" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        如果密碼已經過期，請修改密碼<br />
        <br />
        修改(Update)後，自動記錄今天日期（SQL指令的函數，getdate()）<br />
        &quot;UPDATE [db_user] SET [password] = @password, [real_name] = @real_name, <span class="auto-style1">[enable_time] = <strong>getdate()</strong></span> WHERE [id] = @id&quot;<br />
        <br />
        或是<strong>「修改密碼的日期（今天） + 90天」</strong><br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Edit" ForeColor="#333333" GridLines="None" Height="171px" Width="275px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="password (已經轉成樣板)" SortExpression="password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" Text='<%# Bind("password") %>'></asp:TextBox>
                        &nbsp;(AutoPostBack)<br />

                        <br /><br />
                        舊密碼#1：&nbsp;
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("old_password") %>'></asp:Label>

                        <br /><br />
                        舊密碼#2：&nbsp;
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("old_password").ToString().Replace(";;", "&nbsp;與&nbsp;") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFCCFF" />
                </asp:TemplateField>

                <asp:BoundField DataField="real_name" HeaderText="real_name" SortExpression="real_name" />

                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [db_user] WHERE ([id] = @id)" 
            UpdateCommand="UPDATE [db_user] SET [password] = @password, [real_name] = @real_name, [enable_time] = getdate() WHERE [id] = @id" 
            OnUpdated="SqlDataSource1_Updated">

            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="real_name" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
        <p>
            <asp:Label ID="Label4" runat="server" style="background-color: #99FFCC"></asp:Label>
        </p>
    </form>
</body>
</html>
