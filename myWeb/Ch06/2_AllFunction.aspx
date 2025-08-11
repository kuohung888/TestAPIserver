<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2_AllFunction.aspx.cs" Inherits="Book_Sample_Ch06_2_AllFunction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DetailsView #2</title>
</head>
<body>
    <p>
        DetailsView<strong> (All Function -- 編輯（修改）、刪除、新增)</strong></p>
    <form id="form1" runat="server">
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="50px" 
            Width="600px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" 
                HorizontalAlign="Right" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="日期" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="class" HeaderText="文章分類" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="標題" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="摘要" SortExpression="summary" />
                <asp:BoundField DataField="article" HeaderText="內容（全文）" 
                    SortExpression="article" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="hit_no" HeaderText="點閱次數" SortExpression="hit_no" />
                <asp:BoundField DataField="get_no" HeaderText="評分" SortExpression="get_no" />
                <asp:BoundField DataField="email_no" HeaderText="文章轉寄次數" 
                    SortExpression="email_no" />
                <asp:BoundField DataField="approved" HeaderText="審核？是否可發表？" 
                    SortExpression="approved" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test]" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author], [hit_no], [get_no], [email_no], [approved]) VALUES (@test_time, @class, @title, @summary, @article, @author, @hit_no, @get_no, @email_no, @approved)" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author, [hit_no] = @hit_no, [get_no] = @get_no, [email_no] = @email_no, [approved] = @approved WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="hit_no" Type="Int32" />
                <asp:Parameter Name="get_no" Type="Int32" />
                <asp:Parameter Name="email_no" Type="Int32" />
                <asp:Parameter Name="approved" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="hit_no" Type="Int32" />
                <asp:Parameter Name="get_no" Type="Int32" />
                <asp:Parameter Name="email_no" Type="Int32" />
                <asp:Parameter Name="approved" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            
            
    </p>
    <div>
    
    </div>
    </form>
 
</body>
</html>

