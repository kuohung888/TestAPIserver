<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Advanced_Page_10_Repeater.aspx.cs" Inherits="Book_Sample_Ch14_Advanced_Page_10_Repeater" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style1
        {
            font-weight: bold;
            background-color: #FFFF66;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>
        自己手寫版的分頁程式&nbsp; <span class="style2">DataReader</span>  + <span class="style1">SQL指令的Row_NUMBER</span>（後置程式碼）</p>
    <div>
    
        <a href="http://technet.microsoft.com/zh-tw/library/ms186734.aspx">
        http://technet.microsoft.com/zh-tw/library/ms186734.aspx</a>
    
    </div>
    &nbsp;<br /><br />

        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <div align="center">
                <table border="1" width="90%">
                  <tr>
                    <td><b>id</b></td>
                    <td><b>Date & Time</b></td>
                    <td><b>Title</b></td>
                    <td><b>Summary</b></td>
                  </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                  <td><small> <%#DataBinder.Eval(Container.DataItem, "id")%> </small></td>
                  <td><small> <%#DataBinder.Eval(Container.DataItem, "test_time", "{0:d}")%> </small></td>
                  <td> <b><%#DataBinder.Eval(Container.DataItem, "title")%> </b></td>
                  <td align="left"> <small><%# DataBinder.Eval(Container.DataItem, "summary") %> </small></td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>

    </div>
    <br /><br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br /><br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
    </form>
</body>
</html>
