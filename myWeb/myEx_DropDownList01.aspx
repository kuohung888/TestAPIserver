<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_DropDownList01.aspx.cs" Inherits="myEx_DropDownList01" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>台灣縣市區域連動系統</title>
    <style>
        .form-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        .dropdown-group {
            display: flex;
            gap: 10px;
        }
        select, input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn-submit {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-submit:hover {
            background-color: #45a049;
        }
        .result-panel {
            margin-top: 20px;
            padding: 15px;
            background-color: #e8f5e9;
            border: 1px solid #c8e6c9;
            border-radius: 4px;
            display: none;
        }
        .error-message {
            color: #f44336;
            font-size: 12px;
            margin-top: 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2 style="text-align: center; color: #2e7d32;">台灣住址登記系統</h2>
            
            <!-- 姓名欄位 -->
            <div class="form-group">
                <label for="txtName">姓名</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="請輸入姓名"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" 
                    ErrorMessage="姓名為必填欄位" CssClass="error-message" Display="Dynamic" />
            </div>

            <!-- 縣市區域連動 -->
            <div class="form-group">
                <label>住家地址</label>
                <div class="dropdown-group">
                    <asp:DropDownList ID="ddlCounty" runat="server" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlCounty_SelectedIndexChanged">
                        <asp:ListItem Text="請選擇縣市" Value="" Selected="True" />
                    </asp:DropDownList>
                    
                    <asp:DropDownList ID="ddlDistrict" runat="server">
                        <asp:ListItem Text="請先選擇縣市" Value="" Selected="True" />
                    </asp:DropDownList>
                </div>
                <asp:CustomValidator runat="server" ID="cvAddress" 
                    OnServerValidate="ValidateAddress" 
                    ErrorMessage="請選擇完整縣市區域" CssClass="error-message" Display="Dynamic" />
            </div>

            <!-- 詳細地址 -->
            <div class="form-group">
                <label for="txtAddress">詳細地址</label>
                <asp:TextBox ID="txtAddress" runat="server" placeholder="例：中山路一段100號"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" 
                    ErrorMessage="詳細地址為必填欄位" CssClass="error-message" Display="Dynamic" />
            </div>

            <!-- 送出按鈕 -->
            <div class="form-group" style="text-align: center;">
                <asp:Button ID="btnSubmit" runat="server" Text="送出資料" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>

            <!-- 結果顯示 -->
            <asp:Panel ID="pnlResult" runat="server" CssClass="result-panel">
                <h3 style="margin-top: 0; color: #2e7d32;">登記結果</h3>
                <p><strong>姓名：</strong><asp:Label ID="lblName" runat="server"></asp:Label></p>
                <p><strong>完整地址：</strong><asp:Label ID="lblFullAddress" runat="server"></asp:Label></p>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
