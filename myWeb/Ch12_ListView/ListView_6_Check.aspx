<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListView_6_Check.aspx.cs" Inherits="Book_Sample_Ch12_ListView_ListView_6_Check" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新增或更新之前，檢查欄位是否空白？</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; font-size: large; color: #FF0000"></asp:Label>
        <br />
        <br />
        <hr />
 
         新增或更新之前，檢查欄位是否空白？ 
        <br />

    
 
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" InsertItemPosition="FirstItem" 
        style="font-size: small; font-family: Tahoma" 
        oniteminserting="ListView1_ItemInserting" 
        onitemupdating="ListView1_ItemUpdating">
        <AlternatingItemTemplate>
            <span style="background-color: #FFF8DC;">id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            test_time:
            <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
            <br />
            class:
            <asp:Label ID="classLabel" runat="server" Text='<%# Eval("class") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            summary:
            <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' />
            <br />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
<br /><br /></span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #008A8C;color: #FFFFFF;">id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            test_time:
            <asp:TextBox ID="test_timeTextBox" runat="server" 
                Text='<%# Bind("test_time") %>' />
            <br />
            class:
            <asp:TextBox ID="classTextBox" runat="server" Text='<%# Bind("class") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            summary:
            <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
            <br />
            article:
            <asp:TextBox ID="articleTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("article") %>' />
            <br />
            author:
            <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
            <br />

            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">test_time:
            <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
            <br />class:
            <asp:TextBox ID="classTextBox" runat="server" Text='<%# Bind("class") %>' />
            <br />title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />summary:
            <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
            <br />article:
            <asp:TextBox ID="articleTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("article") %>' />
            <br />author:
            <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #DCDCDC;color: #000000;">id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            test_time:
            <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
            <br />
            class:
            <asp:Label ID="classLabel" runat="server" Text='<%# Eval("class") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            summary:
            <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' />
            <br />
            article:
            <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
            <br />
            author:
            <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
            <br />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
<br /><br /></span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            test_time:
            <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
            <br />
            class:
            <asp:Label ID="classLabel" runat="server" Text='<%# Eval("class") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            summary:
            <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' />
            <br />
            article:
            <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
            <br />
            author:
            <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
            <br />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
<br /><br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
        DeleteCommand="DELETE FROM [test] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author]) VALUES (@test_time, @class, @title, @summary, @article, @author)" 
        SelectCommand="SELECT * FROM [test]" 
        UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author WHERE [id] = @id">
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
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="test_time" Type="DateTime" />
            <asp:Parameter Name="class" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="summary" Type="String" />
            <asp:Parameter Name="article" Type="String" />
            <asp:Parameter Name="author" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
