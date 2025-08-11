<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ListView_Nest.aspx.cs" Inherits="Book_Sample_Ch12_ListView_ListView_Nest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>巢狀 ListView</title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body>
    <p>
        <strong><span class="auto-style1">巢狀 ListView</span></strong>（用來作為主表明細，Master-Details）</p>
    <p>
        外圍 -- test資料表</p>
    <p>
        內部 -- test_talk資料表<br />
    </p>
    <form id="form1" runat="server">
        <p>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" GroupItemCount="3" OnItemCommand="ListView1_ItemCommand">
                <AlternatingItemTemplate>
                    <td runat="server" width="300px" style="background-color: #FFF8DC;">id:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />test_time:
                        <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                        <br />title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />summary:
                        <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' />
                        <br />article:
                        <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
                        <br />author:
                        <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                        <br />
                        <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Button_Select" />
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">id:
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <br />test_time:
                        <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                        <br />title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />summary:
                        <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
                        <br />article:
                        <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                        <br />author:
                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>未傳回資料。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
<td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">test_time:
                        <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                        <br />title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />summary:
                        <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
                        <br />article:
                        <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                        <br />author:
                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" width="300px" style="background-color: #DCDCDC; color: #000000;">id:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />test_time:
                        <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                        <br />title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />summary:
                        <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' />
                        <br />article:
                        <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
                        <br />author:
                        <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                        <br />
                        <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Button_Select" />  
                        <br />
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" width="900px">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">id:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />test_time:
                        <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                        <br />title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />summary:
                        <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' />
                        <br />article:
                        <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
                        <br />author:
                        <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" CommandName="UnSelect" Text="Button_UnSelect" />
                        <br />
                        <br />
                        ===================<br />
                        <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2" GroupItemCount="3">
                            <AlternatingItemTemplate>
                                <td id="Td1" runat="server" style="background-color: #FFFFFF; color: #284775;">id:
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    test_id:
                                    <asp:Label ID="test_idLabel" runat="server" Text='<%# Eval("test_id") %>' />
                                    <br />
                                    test_time:
                                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                                    <br />
                                    article:
                                    <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
                                    <br />
                                    author:
                                    <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                                    <br />
                                    email:
                                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                                    <br />
                                </td>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td id="Td2" runat="server" style="background-color: #999999;">id:
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    test_id:
                                    <asp:TextBox ID="test_idTextBox" runat="server" Text='<%# Bind("test_id") %>' />
                                    <br />
                                    test_time:
                                    <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                                    <br />
                                    article:
                                    <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                                    <br />
                                    author:
                                    <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                    <br />
                                    email:
                                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                                    <br />
                                </td>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table id="Table1" runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                    <tr>
                                        <td>未傳回資料。</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td id="Td3" runat="server" />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <InsertItemTemplate>
                                <td id="Td4" runat="server" style="">test_id:
                                    <asp:TextBox ID="test_idTextBox" runat="server" Text='<%# Bind("test_id") %>' />
                                    <br />
                                    test_time:
                                    <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                                    <br />
                                    article:
                                    <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                                    <br />
                                    author:
                                    <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                    <br />
                                    email:
                                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                                    <br />
                                </td>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <td id="Td5" runat="server" style="background-color: #E0FFFF; color: #333333;">id:
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    test_id:
                                    <asp:Label ID="test_idLabel" runat="server" Text='<%# Eval("test_id") %>' />
                                    <br />
                                    test_time:
                                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                                    <br />
                                    article:
                                    <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
                                    <br />
                                    author:
                                    <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                                    <br />
                                    email:
                                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                                    <br />
                                </td>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="Table2" runat="server">
                                    <tr id="Tr1" runat="server">
                                        <td id="Td6" runat="server">
                                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr id="groupPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="Tr2" runat="server">
                                        <td id="Td7" runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <td id="Td8" runat="server" style="background-color: #E2DED6; font-weight: bold; color: #333333;">id:
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    test_id:
                                    <asp:Label ID="test_idLabel" runat="server" Text='<%# Eval("test_id") %>' />
                                    <br />
                                    test_time:
                                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                                    <br />
                                    article:
                                    <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' />
                                    <br />
                                    author:
                                    <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                                    <br />
                                    email:
                                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                                    <br />
                                    <asp:Button ID="EditButton1" runat="server" CommandName="Edit" Text="編輯" />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test_talk] WHERE [id] = @id" InsertCommand="INSERT INTO [test_talk] ([test_id], [test_time], [article], [author], [email]) VALUES (@test_id, @test_time, @article, @author, @email)" SelectCommand="SELECT * FROM [test_talk] WHERE ([test_id] = @test_id)" UpdateCommand="UPDATE [test_talk] SET [test_id] = @test_id, [test_time] = @test_time, [article] = @article, [author] = @author, [email] = @email WHERE [id] = @id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="test_id" Type="Int32" />
                                <asp:Parameter Name="test_time" Type="DateTime" />
                                <asp:Parameter Name="article" Type="String" />
                                <asp:Parameter Name="author" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ListView1" Name="test_id" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="test_id" Type="Int32" />
                                <asp:Parameter Name="test_time" Type="DateTime" />
                                <asp:Parameter Name="article" Type="String" />
                                <asp:Parameter Name="author" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title], [summary], [article], [author]) VALUES (@test_time, @title, @summary, @article, @author)" SelectCommand="SELECT [id], [test_time], [title], [summary], [article], [author] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="test_time" Type="DateTime" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="summary" Type="String" />
                    <asp:Parameter Name="article" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="test_time" Type="DateTime" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="summary" Type="String" />
                    <asp:Parameter Name="article" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    <div>
    
    </div>
    </form>
</body>
</html>
