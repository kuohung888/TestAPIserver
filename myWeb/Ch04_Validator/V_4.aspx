<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_4.aspx.cs" Inherits="Ch04_Validator_V_4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <p>
        比較範圍區間（數字的上限與下限），必須在 1~150之間。</p>
    <form id="form1" runat="server">
    <p>
        請輸入您的年紀：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Submit / 送出" />
    </p>
    <p>
        <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="RangeValidator。人的年紀只能在1~150之間" 
            MaximumValue="150" MinimumValue="1" Type="Integer" ForeColor="Red"></asp:RangeValidator>
    </p>
    <div>
    
    </div>
    </form>
 
</body>
</html>

