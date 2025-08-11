<%@ Page Language="C#" AutoEventWireup="true" CodeFile="France_Orange_TEL.aspx.cs" Inherits="Book_Sample_Ch09_France_Orange_TEL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-weight: bold;
        }
        .style2
        {
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            與美工人員設計好的HTML一起搭配。<br />
            <br />
            <table border="0" width="626px" id="table1" cellspacing="0" cellpadding="0">
                <tr>
                    <td background="images/bgOpenTopL.jpg" height="156px" width="76px"></td>
                    <td height="156px" background="images/bgOpenTopR.jpg" width="550px">
                        <span class="style1">漂亮的網站首頁</span><br />
                        (HTML 網頁與 ASP.NET檔案結合)
                    </td>
                </tr>
                <tr>
                    <td width="73px" background="images/bgOpenMidTileL.gif"></td>
                    <td background="images/bgOpenMidTileR.gif"></td>
                </tr>
                <tr>
                    <td width="73px" background="images/bgOpenMidTileL.gif"></td>
                    <td background="images/bgOpenMidTileR.gif">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="520px">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title], [author]) VALUES (@test_time, @title, @author)" SelectCommand="SELECT [id], [test_time], [title], [author] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title, [author] = @author WHERE [id] = @id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="test_time" Type="DateTime" />
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="author" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="test_time" Type="DateTime" />
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="author" Type="String" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td width="73px" background="images/bgOpenMidTileL.gif"></td>
                    <td background="images/bgOpenMidTileR.gif"></td>
                </tr>
                <tr>
                    <td width="73px" background="images/bgOpenMidTileL.gif"></td>
                    <td background="images/bgOpenMidTileR.gif">===================================================<br />
                        <span class="style2">XYZ公司</span><br />
                        台北市中華路一段七號八樓<br />
                        TEL : (02) 1234-5678<br />
                    </td>
                </tr>
                <tr>
                    <td width="76px" background="images/bgOpenBotL.jpg" height="173px"></td>
                    <td background="images/bgOpenMidTileR.gif" width="550px" valign="bottom">
                        <img border="0" src="images/bgOpenBotR.jpg" width="550px" height="28px">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
