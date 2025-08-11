<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListView_1.aspx.cs" Inherits="Ch12_ListView_ListView_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> ListView</title>
    <style type="text/css">
        .style1
        {
            font-size: medium;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <span class="style1">這個 ListView控制項，只修改了 &lt;ItemTemplate&gt;的日期欄位而已。<br />
     &lt;AlternatingItemTemplate&gt;未修改。所以執行結果，會發生一點小缺失～</span>
     <hr />
     <br />
     <br />
    <div style="font-size: small">
    
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <span style="background-color: #FF99CC;">id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                test_time「日期欄位」:
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
                hit_no:
                <asp:Label ID="hit_noLabel" runat="server" Text='<%# Eval("hit_no") %>' />
                <br />
                get_no:
                <asp:Label ID="get_noLabel" runat="server" Text='<%# Eval("get_no") %>' />
                <br />
                email_no:
                <asp:Label ID="email_noLabel" runat="server" Text='<%# Eval("email_no") %>' />
                <br />
                approved:
                <asp:Label ID="approvedLabel" runat="server" Text='<%# Eval("approved") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <br />
                <br />
                </span>
            </AlternatingItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <span ID="itemPlaceholder" runat="server"></span></span>
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
            <InsertItemTemplate>
                <span style="">test_time:
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
                <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                <br />
                author:
                <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                <br />
                hit_no:
                <asp:TextBox ID="hit_noTextBox" runat="server" Text='<%# Bind("hit_no") %>' />
                <br />
                get_no:
                <asp:TextBox ID="get_noTextBox" runat="server" Text='<%# Bind("get_no") %>' />
                <br />
                email_no:
                <asp:TextBox ID="email_noTextBox" runat="server" 
                    Text='<%# Bind("email_no") %>' />
                <br />
                approved:
                <asp:TextBox ID="approvedTextBox" runat="server" 
                    Text='<%# Bind("approved") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
                <br />
                <br />
                </span>
            </InsertItemTemplate>
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
                hit_no:
                <asp:Label ID="hit_noLabel" runat="server" Text='<%# Eval("hit_no") %>' />
                <br />
                get_no:
                <asp:Label ID="get_noLabel" runat="server" Text='<%# Eval("get_no") %>' />
                <br />
                email_no:
                <asp:Label ID="email_noLabel" runat="server" Text='<%# Eval("email_no") %>' />
                <br />
                approved:
                <asp:Label ID="approvedLabel" runat="server" Text='<%# Eval("approved") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <br />
                <br />
                </span>
            </SelectedItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned. 抱歉！資料庫裡面找不任何資料～</span>
            </EmptyDataTemplate>
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
                <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                <br />
                author:
                <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                <br />
                hit_no:
                <asp:TextBox ID="hit_noTextBox" runat="server" Text='<%# Bind("hit_no") %>' />
                <br />
                get_no:
                <asp:TextBox ID="get_noTextBox" runat="server" Text='<%# Bind("get_no") %>' />
                <br />
                email_no:
                <asp:TextBox ID="email_noTextBox" runat="server" 
                    Text='<%# Bind("email_no") %>' />
                <br />
                approved:
                <asp:TextBox ID="approvedTextBox" runat="server" 
                    Text='<%# Bind("approved") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
                <br />
                <br />
                </span>
            </EditItemTemplate>
            <ItemTemplate>
                id:<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                <br />
                test_time:
                <asp:Label ID="test_timeLabel" runat="server" 
                    Text='<%# Eval("test_time", "{0:d}") %>'></asp:Label>
                <br />
                class:
                <asp:Label ID="classLabel" runat="server" Text='<%# Eval("class") %>'></asp:Label>
                <br />
                title:
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                <br />
                summary:
                <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>'></asp:Label>
                <br />
                article:
                <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>'></asp:Label>
                <br />
                author:
                <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>'></asp:Label>
                <br />
                hit_no:
                <asp:Label ID="hit_noLabel" runat="server" Text='<%# Eval("hit_no") %>'></asp:Label>
                <br />
                get_no:
                <asp:Label ID="get_noLabel" runat="server" Text='<%# Eval("get_no") %>'></asp:Label>
                <br />
                email_no:
                <asp:Label ID="email_noLabel" runat="server" Text='<%# Eval("email_no") %>'></asp:Label>
                <br />
                approved:
                <asp:Label ID="approvedLabel" runat="server" Text='<%# Eval("approved") %>'></asp:Label>
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <br />
                <br />
            </ItemTemplate>
        </asp:ListView>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            DeleteCommand="DELETE FROM [test] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author], [hit_no], [get_no], [email_no], [approved]) VALUES (@test_time, @class, @title, @summary, @article, @author, @hit_no, @get_no, @email_no, @approved)" 
            SelectCommand="SELECT * FROM [test]" 
            UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author, [hit_no] = @hit_no, [get_no] = @get_no, [email_no] = @email_no, [approved] = @approved WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
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
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
