<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_textbox4.aspx.cs" Inherits="myEx_textbox4" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <title>台灣身分證驗證範例</title>
  <style>
  .progress {
    height: 20px;
    margin-top: 5px;
    width: 200px;
    background-color: #f5f5f5;
    border-radius: 4px;
    box-shadow: inset 0 1px 2px rgba(0,0,0,.1);
}

.progress-bar {
    float: left;
    height: 100%;
    font-size: 12px;
    line-height: 20px;
    color: #fff;
    text-align: center;
    background-color: #337ab7;
    transition: width .6s ease;
}

.progress-bar-danger {
    background-color: #d9534f;
}

.progress-bar-warning {
    background-color: #f0ad4e;
}

.progress-bar-success {
    background-color: #5cb85c;
}
  </style>
</head>
<body>
    <h2>台灣身分證驗證範例</h2>
    <hr />
<form id="form1" runat="server">
        <div>            
            <asp:Label ID="lblInstruction" runat="server" Text="請輸入台灣身分證字號:"></asp:Label>
            <asp:TextBox ID="txtIDNumber" runat="server" MaxLength="10" placeholder="A123456789"></asp:TextBox>
            <asp:Button ID="btnValidateID" runat="server" Text="驗證" OnClick="btnValidateID_Click" />
            <br />
            <asp:Label ID="lblIDResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>