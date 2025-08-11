<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NamingContainer_FindControl_1.aspx.cs" Inherits="Book_Sample_Ch10_FindControl_NamingContainer_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <p>
        .FindControl()方法</p>
    <p>
        <a href="http://msdn.microsoft.com/zh-tw/library/System.Web.UI.Control.FindControl(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/System.Web.UI.Control.FindControl(v=vs.110).aspx</a></p>
    <p>
        在目前的<strong>「命名容器」</strong>搜尋指定的伺服器控制項。 
    </p>
    <p>
        Searches the current <strong>&quot;naming container&quot; </strong>for the specified server control.<br />
    </p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
    <div>
    
        本範例來源：<a href="http://msdn.microsoft.com/zh-tw/library/486wc64h(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/486wc64h(v=vs.110).aspx</a>
        <br />
        <br />
    
    </div>
        <asp:TextBox ID="TextBox1" runat="server">Hello!!</asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_FindControl" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" style="color: #FF0000"></asp:Label>
    </form>
</body>
</html>
