<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_Select.aspx.cs" Inherits="Book_Sample_Ch12_ListView_Repeater_Select" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #006600;
        }
        .style2
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <span class="style1">Repeater</span>，作<b>主表明細（Master-Detail）</b><br />
        下一頁（Disp.aspx）會呈現這一篇文章的內容。<br />
        <br />
        使用 &lt;a&gt;傳統超連結，搭配 <span class="style2">&lt;%</span># Eval(&quot;id&quot;)<span class="style2">%&gt;</span>，以<b>字串相連</b>的方式來完成。<br />
        <br />
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

            <HeaderTemplate>
                <div align="center">
                    <table border="1" width="90%">
                        <tr>
                            <td bgcolor="#800000"><font color="#FFFFFF"><b>選取</b></font></td>
                            <td bgcolor="#800000"><font color="#FFFFFF"><b>id</b></font></td>
                            <td bgcolor="#800000"><font color="#FFFFFF"><b>Title(標題)</b></font></td>
                            <td bgcolor="#800000"><font color="#FFFFFF"><b>Author(作者)</b></font></td>
                        </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <small>

                            <!-- 重點！！！ -->
                            <a href='Disp.aspx?id=<%#Eval("id")%>' target="_blank">點選後，呈現內容</a>

                        </small>
                    </td>
                    <td><small><%#Eval("id")%></small></td>
                    <td><b><%#Eval("title")%> </b></td>
                    <td align="left"><small><%#Eval("author")%> </small></td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT top 10 [id], [title], [author] FROM [test]"></asp:SqlDataSource>


        <br />

    </div>
    </form>
</body>
</html>
