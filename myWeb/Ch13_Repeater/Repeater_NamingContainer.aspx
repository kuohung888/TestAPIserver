<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_NamingContainer.aspx.cs" Inherits="Book_Sample_Ch12_ListView_Repeater_NamingContainer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style2
        {
            background-color: #FF99FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>NamingContainer</b><br />
    
        參考資料：<a 
            href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.namingcontainer(v=VS.100).aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.namingcontainer(v=VS.100).aspx</a>
        <br />
        <br />
        <br />
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID = "SqlDataSource1" 
            onitemcommand="Repeater1_ItemCommand">
            <HeaderTemplate>
                <div align="center">
                <table border="1" width="90%">
                  <tr>
                    <td class="style2"></td>
                    <td><b>id</b></td>
                    <td><b>Date & Time</b></td>
                    <td><b>Title</b></td>
                  </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                  <td class="style2">
                            <asp:Button ID="Button1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "title") %>'  />
                  </td>
                  <td><asp:Label ID="Label1" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "id")%>' /></td>
                  <td><small> <asp:Label ID="Label2" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "test_time", "{0:d}")%>'  /> </small></td>
                  <td> <b><asp:Label ID="Label3" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "title")%>'  /> </b></td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 [id], [test_time], [title] FROM [test]">
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Button" onclick="Button2_Click" />
        <br />

         <asp:Label ID="myLabel1" Runat="server" style="color: #009900">請比對HTML原始碼！</asp:Label>
         <br />
         <asp:Label ID="myLabel2" Runat="server" style="color: #6600FF"></asp:Label>
         <br />

    </div>
    </form>
</body>
</html>
