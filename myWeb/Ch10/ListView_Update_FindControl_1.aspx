<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="ListView_Update_FindControl_1.aspx.cs" Inherits="Book_Sample_Ch10_ListView_Update_2_FindControl_Easy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

    .auto-style1 {
        background-color: #FF99FF;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>ListView與 .FindControl()方法&nbsp;&nbsp; #1&nbsp; <span class="auto-style1">寫在 Page_Load事件會報錯</span></strong><br />
        <br />
        ListView先天就是「樣版」的狀態，跟FormView一樣<br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" GroupItemCount="3" 
            OnDataBound="ListView1_DataBound">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF; color: #284775;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />test_time:
                    <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                    <br />title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF; color: #333333;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
                <td runat="server" style="background-color: #E2DED6; font-weight: bold; color: #333333;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title]) VALUES (@test_time, @title)" SelectCommand="SELECT [id], [test_time], [title] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
