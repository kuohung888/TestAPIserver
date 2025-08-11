<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_1_AJAX.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V1_AJAX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>驗證控制項與ASP.NET AJAX (UpdatePanel)</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         驗證控制項與ASP.NET AJAX (UpdatePanel)<br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
            <ContentTemplate>
                ========================================================<br />
                請輸入：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator 必填欄位" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <%= System.DateTime.Now.ToLongTimeString() %>
                <br />========================================================<br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
        <%= System.DateTime.Now.ToLongTimeString() %>
    
    </div>
    </form>
</body>
</html>
