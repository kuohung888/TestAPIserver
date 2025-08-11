<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Case_MemberAdd_Login.aspx.cs" Inherits="Book_Sample_Ch16_Case_MemberAdd_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <br /><br /><br />
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2014/07/31/login_and_member_add_the_same_page.aspx"><strong>會員新增（註冊）、會員登入，如何在同一頁、同一個功能完成？</strong> </a><br />
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2014/07/31/login_and_member_add_the_same_page.aspx">(兼論：會員登入這麼簡單的功能，需要學哪些基本技巧？)</a>
    
    </div>
        <p>
            <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2014/07/31/login_and_member_add_the_same_page.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2014/07/31/login_and_member_add_the_same_page.aspx</a></p>
        <p>
            &nbsp;</p>
        <p>
            帳號：<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
&nbsp;(AutoPostBack)</p>
        <p>
            密碼：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_會員登入" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            ==========================================</p>
        <p>
            底下是「障眼法」：</p>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            ****** Panel ****** （預先設定為「看不見」，.Visible = false）<br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="415px">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="real_name" HeaderText="real_name" SortExpression="real_name" />
                    <asp:BoundField DataField="name" HeaderText="name（帳號）" SortExpression="name" />
                    <asp:BoundField DataField="password" HeaderText="password（密碼）" SortExpression="password" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [db_user] WHERE [id] = @id" InsertCommand="INSERT INTO [db_user] ([real_name], [name], [password], [email]) VALUES (@real_name, @name, @password, @email)" SelectCommand="SELECT [id], [real_name], [name], [password], [email] FROM [db_user]" UpdateCommand="UPDATE [db_user] SET [real_name] = @real_name, [name] = @name, [password] = @password, [email] = @email WHERE [id] = @id" OnInserted="SqlDataSource1_Inserted">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="real_name" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="real_name" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            ******************</asp:Panel>
    </form>
    <p>
        學會了以後，接下來您要作什麼？</p>
    <p>
        1. 有沒有發現兩個事件的程式碼，幾乎90%雷同？</p>
    <p>
        2. 把相同的程式，抽離出來吧！</p>
    <p>
        &nbsp;</p>
</body>
</html>
