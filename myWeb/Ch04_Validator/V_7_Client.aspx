<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_7_Client.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V_7_Client" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FF9999;
        }
        .style2
        {
            font-weight: bold;
            background-color: #66FF66;
        }
    </style>

    <!-- 重點在此！！-->
    <script language="javascript" type="text/javascript">
        function IsEven(source, args) {
            if (args.Value % 2 == 0) {
                args.IsValid = true;
                window.alert("驗證成功，偶數！");
            }
            else {
                args.IsValid = false;
                window.alert("驗證失敗，奇數！（無法被二整除）");
            }

            return;
        }
    </script>


</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1">CustomValidator-- 「ClientValidationFunction屬性」</span> + <span class="style2">使用 
        Client端的驗證程式（JavaScript）</span><br />
        <br />
        <br />
        請輸入偶數：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <asp:Button ID="Button1" runat="server" Text="Button" />

        <asp:CustomValidator ID="CustomValidator1" runat="server" 
            ClientValidationFunction="IsEven" 
            ErrorMessage="CustomValidator -- 不是偶數！！" 
            ForeColor="Red" 
            ControlToValidate="TextBox1" 
            onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
    
    </div>
    </form>
</body>
</html>
