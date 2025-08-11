<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fullEx01_textboxApp.aspx.cs" Inherits="fullEx01_textboxApp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


    <title>會員註冊系統</title>
    <style type="text/css">
        /* 整體版面設定 */
        body {
            font-family: 'Microsoft JhengHei', Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
        }
        
        /* 表單樣式 */
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #34495e;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        select.form-control {
            height: 40px;
        }
        .error-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
        }
        
        /* 按鈕樣式 */
        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s;
        }
        .btn-submit:hover {
            background-color: #2980b9;
        }

                /* 清空按鈕基礎樣式 */
        .btn-clear {
            background-color: #ff6b6b; /* 警示色 */
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        /* 懸停與互動效果 */
        .btn-clear:hover {
            background-color: #ff5252;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .btn-clear:active {
            transform: translateY(0);
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        /* 註冊結果區 */
        .result-panel {
            margin-top: 30px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 4px;
            border-left: 4px solid #3498db;
        }
        .result-title {
            font-weight: bold;
            margin-bottom: 10px;
            color: #2c3e50;
        }
        .result-item {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>會員註冊</h1>
        <form id="form1" runat="server">
            <!-- 姓名欄位 (僅中文) -->
            <div class="form-group">
                <label for="txtName">姓名：</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="請輸入中文姓名"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                    ErrorMessage="姓名為必填欄位" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName"
                    ValidationExpression="^[\u4e00-\u9fa5]{2,}$" ErrorMessage="請輸入正確中文姓名" 
                    CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <!-- 生日欄位 -->
            <div class="form-group">
                <label for="txtBirthday">生日：</label>
                <asp:TextBox ID="txtBirthday" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBirthday" runat="server" ControlToValidate="txtBirthday"
                    ErrorMessage="生日為必填欄位" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvBirthday" runat="server" ControlToValidate="txtBirthday"
                    Operator="LessThanEqual" Type="Date" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>"
                    ErrorMessage="生日日期不可超過今日" CssClass="error-message" Display="Dynamic"></asp:CompareValidator>
            </div>
            
            <!-- Email欄位 -->
            <div class="form-group">
                <label for="txtEmail">電子郵件：</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="example@domain.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email為必填欄位" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                    ErrorMessage="請輸入有效的Email格式" CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <!-- 帳號欄位 -->
            <div class="form-group">
                <label for="txtAccount">註冊帳號：</label>
                <asp:TextBox ID="txtAccount" runat="server" CssClass="form-control" placeholder="4-20位英數字"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAccount" runat="server" ControlToValidate="txtAccount"
                    ErrorMessage="帳號為必填欄位" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revAccount" runat="server" ControlToValidate="txtAccount"
                    ValidationExpression="^[a-zA-Z0-9]{4,20}$" ErrorMessage="帳號須為4-20位英數字"
                    CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <!-- 密碼欄位 -->
            <div class="form-group">
                <label for="txtPassword">密碼：</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="至少8碼含英文、數字、特殊字元"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="密碼為必填欄位" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                    ValidationExpression="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$"
                    ErrorMessage="密碼需含英文、數字、特殊字元且至少8碼" CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <!-- 手機號碼欄位 -->
            <div class="form-group">
                <label for="txtPhone">手機號碼：</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="09XXXXXXXX"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="手機號碼為必填欄位" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                    ValidationExpression="^09\d{8}$" ErrorMessage="請輸入正確台灣手機格式(09開頭共10碼)"
                    CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <!-- 興趣下拉選單 -->
            <div class="form-group">
                <label for="ddlInterest">興趣：</label>
                <asp:DropDownList ID="ddlInterest" runat="server" CssClass="form-control">
                    <asp:ListItem Value="" Text="--請選擇興趣--" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="閱讀" Text="閱讀"></asp:ListItem>
                    <asp:ListItem Value="游泳" Text="游泳"></asp:ListItem>
                    <asp:ListItem Value="音樂" Text="音樂"></asp:ListItem>
                    <asp:ListItem Value="運動" Text="運動"></asp:ListItem>
                    <asp:ListItem Value="購物" Text="購物"></asp:ListItem>
                    <asp:ListItem Value="上網" Text="上網"></asp:ListItem>
                    <asp:ListItem Value="旅遊" Text="旅遊"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvInterest" runat="server" ControlToValidate="ddlInterest"
                    InitialValue="" ErrorMessage="請選擇興趣" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <!-- 按鈕 -->
            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="註冊" CssClass="btn-submit" OnClick="btnRegister_Click" />
                           <!-- 新增清空按鈕 -->
               <button type="reset" id="btnClear" class="btn-clear">清空重填</button>
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            
            
            <!-- 註冊結果顯示區 -->
            <asp:Panel ID="pnlResult" runat="server" CssClass="result-panel" Visible="false">
                <div class="result-title">註冊資訊確認</div>
                <div class="result-item"><strong>姓名：</strong><asp:Literal ID="litName" runat="server"></asp:Literal></div>
                <div class="result-item"><strong>生日：</strong><asp:Literal ID="litBirthday" runat="server"></asp:Literal></div>
                <div class="result-item"><strong>電子郵件：</strong><asp:Literal ID="litEmail" runat="server"></asp:Literal></div>
                <div class="result-item"><strong>帳號：</strong><asp:Literal ID="litAccount" runat="server"></asp:Literal></div>
                <div class="result-item"><strong>密碼：</strong><asp:Literal ID="litPassword" runat="server"></asp:Literal></div>
                <div class="result-item"><strong>手機號碼：</strong><asp:Literal ID="litPhone" runat="server"></asp:Literal></div>
                <div class="result-item"><strong>興趣：</strong><asp:Literal ID="litInterest" runat="server"></asp:Literal></div>
            </asp:Panel>
        </form>
    </div>
</body>
</html>
