<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListView_DataPager_Manual.aspx.cs" Inherits="Book_Sample_Ch12_ListView_ListView_DataPager_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            後置程式碼，修改 DataPager的「PageSize」
        </p>
        <p>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
                <asp:ListItem Selected="True">3</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td id="Td1" runat="server" style="background-color: #FFFFFF; color: #284775;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td id="Td2" runat="server" style="background-color: #999999;">id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    test_time:
                    <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
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
                <td id="Td4" runat="server" style="">test_time:
                    <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
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
                    test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
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
                        <td id="Td7" runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
                <td id="Td8" runat="server" style="background-color: #E2DED6; font-weight: bold; color: #333333;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
        <p>
            <br />
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <div>
        </div>
    </form>
</body>
</html>
