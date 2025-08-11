<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_DropDownList02.aspx.cs" Inherits="myEx_DropDownList02" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>台灣郵遞區號連動系統</title>
  
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f3f3f3;
    text-align: left;
}

        /* Label 固定寬度 80px、文字靠左 */
.form-label {
  flex: 0 0 80px;
  text-align: left;
  margin-right: 10px;
}

/* Input / Select 撐滿剩餘空間 */
.input-box,
.select-box {
  flex: 1;
  width: auto; /* 取消 inline Width="100%" 的強制換行 */
}

.container {
    text-align: left;
    width: 500px;
    margin: 50px auto;
    background: #fff;
    padding: 20px;
    border-radius: 6px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

/* 針對所有 asp:Label 控制項文字靠左 */
.container label {
  display: inline-block;
  width: 200px;       /* 調整寬度以對齊欄位 */
  text-align: left;  /* 靠左對齊 */
  margin-right: 10px;
}

h2 {
    text-align: left;
    margin-bottom: 20px;
    color: #333;
}


.btn {
    width: 100%;
    padding: 8px;
    background: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn:hover {
    background: #45a049;
}

.result-panel {
    margin-top: 20px;
    padding: 10px;
    border: 1px solid #4CAF50;
    background: #e8f5e9;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <div class="container">
    <h2>填寫表單</h2>

    <div class="field-row">
      <asp:Label ID="lblName" runat="server"
        Text="姓名：" CssClass="form-label" />
      <asp:TextBox ID="txtName" runat="server"
        CssClass="input-box" />
      <asp:RequiredFieldValidator ID="rfvName" runat="server"
        ControlToValidate="txtName"
        ErrorMessage="姓名必填" ForeColor="red" />
    </div>

    <div class="field-row">
      <asp:Label ID="lblCity" runat="server"
        Text="縣市：" CssClass="form-label" />
      <asp:DropDownList ID="ddlCity" runat="server"
        AutoPostBack="true"
        OnSelectedIndexChanged="ddlCity_SelectedIndexChanged"
        CssClass="select-box" />
      <asp:RequiredFieldValidator ID="rfvCity" runat="server"
        ControlToValidate="ddlCity" InitialValue=""
        ErrorMessage="請選擇縣市" ForeColor="red" />
    </div>

    <div class="field-row">
      <asp:Label ID="lblDistrict" runat="server"
        Text="區域：" CssClass="form-label" />
      <asp:DropDownList ID="ddlDistrict" runat="server"
        AutoPostBack="true"
        OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged"
        CssClass="select-box" />
      <asp:RequiredFieldValidator ID="rfvDistrict" runat="server"
        ControlToValidate="ddlDistrict" InitialValue=""
        ErrorMessage="請選擇區域" ForeColor="red" />
    </div>

    <div class="field-row">
      <asp:Label ID="lblZip" runat="server"
        Text="郵遞區號：" CssClass="form-label" />
      <asp:DropDownList ID="ddlZip" runat="server"
        CssClass="select-box" />
      <asp:RequiredFieldValidator ID="rfvZip" runat="server"
        ControlToValidate="ddlZip" InitialValue=""
        ErrorMessage="請選擇郵遞區號" ForeColor="red" />
    </div>

    <div class="field-row">
      <asp:Label ID="lblAddress" runat="server"
        Text="地址：" CssClass="form-label" />
      <asp:TextBox ID="txtAddress" runat="server"
        CssClass="input-box" />
      <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
        ControlToValidate="txtAddress"
        ErrorMessage="地址必填" ForeColor="red" />
    </div>

    <asp:Button ID="btnSubmit" runat="server"
      Text="送出" CssClass="btn" OnClick="btnSubmit_Click" />

    <asp:Panel ID="pnlResult" runat="server"
      CssClass="result-panel" Visible="false">
      <h3>填寫結果</h3>
      <asp:Literal ID="litResult" runat="server" />
    </asp:Panel>
  </div>
</form>
</body>
</html>