<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_7_Email.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V_7_Email" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            自己寫程式來作驗證 #3（習題 / 搭配後置程式碼的 Snippet）<br />
        <br />
        請輸入您的E-Mail：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit / 送出" />
    

    <br />
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ControlToValidate="TextBox1" 
                ErrorMessage="CustomValidator，驗證錯誤！！E-Mail格式不符，沒有＠符號！" ForeColor="Red" 
                onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator，不可留白！" 
                ForeColor="#009900"></asp:RequiredFieldValidator>
    <br />
            <br />
    後置程式碼（Code Behind）會透過 _ServerValidate()事件來處理：<br />
    您剛剛輸入的資料是：<asp:Label ID="Label1" runat="server" Font-Bold="True" 
        ForeColor="Blue" Text="Label"></asp:Label>
    </div>
    </form>
 
</body>
</html>
