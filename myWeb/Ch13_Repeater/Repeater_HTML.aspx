<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_HTML.aspx.cs" Inherits="Book_Sample_Ch12_ListView_Repeater_HTML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搭配HTML外觀的 Repeater</title>
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
    
        搭配HTML外觀的 Repeater --  與美工人員設計好的HTML一起搭配。<br />
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2013/03/19/aspnet_html_table_20120319.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2013/03/19/aspnet_html_table_20120319.aspx</a><br />
        <br />
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
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
            </HeaderTemplate>


            <ItemTemplate>
                <tr>
                    <td width="73px" background="images/bgOpenMidTileL.gif"></td>
                    <td background="images/bgOpenMidTileR.gif">
                        ******** 這裡就是畫面中，可以放入ASP.NET控制項的位置******<br />
                        <%# Eval("test_time", "{0:yyyy/MM/dd}") %><br />
                        <%# Eval("title") %><hr />
                    </td>
                </tr>
            </ItemTemplate>


            <FooterTemplate> 
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
            </FooterTemplate>
        </asp:Repeater>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
