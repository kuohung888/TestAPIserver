<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_textbox6.aspx.cs" Inherits="myEx_textbox6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>密碼強度驗證範例</title>
   <style>
        .progress-container {
            width: 300px;
            margin-top: 10px;
        }
        .progress-bar {
            height: 20px;
            background-color: #f5f5f5;
            border-radius: 4px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,.1);
            margin-bottom: 5px;
        }
        .progress-value {
            height: 100%;
            border-radius: 4px;
            transition: width 0.6s ease;
        }
        .weak {
            background-color: #d9534f;
            width: 30%;
        }
        .medium {
            background-color: #f0ad4e;
            width: 60%;
        }
        .strong {
            background-color: #5cb85c;
            width: 100%;
        }
        .strength-text {
            font-weight: bold;
        }
        .weak-text { color: #d9534f; }
        .medium-text { color: #f0ad4e; }
        .strong-text { color: #5cb85c; }
    </style>
</head>
<body>
    <h2>密碼強度驗證範例</h2>
    <hr />
   <form id="form1" runat="server">
        <div>
            <h3 style="color:brown">密碼強度判斷</h3>
            <asp:Label ID="lblPassword" runat="server" Text="請輸入密碼:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" 
                placeholder="輸入密碼測試強度" AutoPostBack="true" 
                OnTextChanged="txtPassword_TextChanged"></asp:TextBox>
            
            <div class="progress-container">
                <div class="progress-bar">
                    <div id="progressValue" runat="server" class="progress-value"></div>
                </div>
                <asp:Label ID="lblPasswordStrength" runat="server" CssClass="strength-text" Text="密碼強度: "></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
