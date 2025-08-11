<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MSDN_02.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_MSDN_02" %>

<!-- *************************************** -->
<!-- 請參閱 http://msdn.microsoft.com/zh-tw/library/w70c655a(v=vs.100).aspx -->

<%@ Reference Control="MSDN_UC.ascx" %>
<!-- *************************************** -->

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>HOW TO：以程式設計方式建立 ASP.NET 使用者控制項的執行個體</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        HOW TO：以程式設計方式建立 ASP.NET 使用者控制項的執行個體<br />
        <a href="http://msdn.microsoft.com/zh-tw/library/c0az2h86(v=vs.80).aspx">http://msdn.microsoft.com/zh-tw/library/c0az2h86(v=vs.80).aspx</a>&nbsp;
        <br /><br />
    

      <asp:PlaceHolder runat="server" ID="PlaceHolder1" />      <br />

      <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"  />      <br /><br />

      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>


    </div>
    </form>
</body>
</html>
