<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_Container_DataItem.aspx.cs" Inherits="Book_Sample_Ch12_ListView_Repeater_Container_DataItem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>HOW TO：存取控制項命名容器的成員</b><br />
        參考資料：<a href="http://msdn.microsoft.com/zh-tw/library/858twd77(v=VS.100).aspx#Y1392">http://msdn.microsoft.com/zh-tw/library/858twd77(v=VS.100).aspx#Y1392</a> <br />
        <br />
        <br />
        <table>
              <asp:repeater id="Repeater1" runat="server" >
                      <ItemTemplate>
                                <tr>
                                  <td align="center" style="width:100%;">

                                       <span id="message" runat="server">
                                             <%# Container.DataItem%>
                                       </span>

                                  </td>
                                </tr>
                      </ItemTemplate>
              </asp:repeater>
        </table>
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test]" >
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

