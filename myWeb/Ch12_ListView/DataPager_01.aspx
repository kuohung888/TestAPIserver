<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataPager_01.aspx.cs" Inherits="Book_Sample_Ch12_ListView_DataPager_01" %>

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
    <p>
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.datapager.pagesize.aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.datapager.pagesize.aspx</a>
        <br />
    </p>
    <form id="form1" runat="server">
        <p>
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="12">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </p>
        <p>
            重點：<strong>PagedControlID屬性</strong>（針對哪一個控制項，進行分頁。<span class="auto-style1"><strong>目前只能用在ListView身上</strong></span>）</p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>PageSize屬性&nbsp;</strong>（每一頁要呈現幾筆記錄？）</p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
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
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
    <div>
    
    </div>
    </form>
</body>
</html>
