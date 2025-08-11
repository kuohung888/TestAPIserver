<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_1.aspx.cs" Inherits="Ch12_ListView_Repeater_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>隔列變色</title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <div align="center">
                <table border="1" width="90%">
                  <tr>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>id</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Date & Time</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Title</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Summary</b></font></td>
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
            
            <AlternatingItemTemplate >
                <tr>
                  <td bgcolor="#cccccc"><small> <%#DataBinder.Eval(Container.DataItem, "id")%> </small></td>
                  <td bgcolor="#cccccc"><small> <%#DataBinder.Eval(Container.DataItem, "test_time", "{0:d}")%> </small></td>
                  <td bgcolor="#cccccc"> <b><%#DataBinder.Eval(Container.DataItem, "title")%> </b></td>
                  <td bgcolor="#cccccc" align="left"> <small><%# DataBinder.Eval(Container.DataItem, "summary") %> </small></td>
                </tr>
            </AlternatingItemTemplate>

            <FooterTemplate>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT * FROM [test]">            
        </asp:SqlDataSource>
        <br />
    </form>
 
</body>
</html>
