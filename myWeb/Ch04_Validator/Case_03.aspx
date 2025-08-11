<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Case_03.aspx.cs" Inherits="Book_Sample_Ch04_Validator_case_03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #0000FF;
            font-weight: bold;
        }
        .style2
        {
            color: #990000;
            font-weight: bold;
        }
        .style3
        {
            color: #FFFF99;
            background-color: #990033;
        }
        .style4
        {
            color: #990033;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <b>請設定驗證控制項的<span class="style3">「ValidationGroup」屬性</span><br />
                相同屬性，也需要在<span class="style4"> Button按鈕</span>做設定！！</b><br />
            <br />
            <span class="style2">Account #1 :</span>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="TextBox1" ErrorMessage="必填（不可空白）/A1群組" ForeColor="#FF3300"
                SetFocusOnError="True" ValidationGroup="A1"></asp:RequiredFieldValidator>
            <br />
            <span class="style2">Password #1 :</span>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="TextBox2" ErrorMessage="必填（不可空白）/A1群組" ForeColor="#FF3300"
                SetFocusOnError="True" ValidationGroup="A1"></asp:RequiredFieldValidator>
            <br />
            <br />
            <hr />
            <br />
            <span class="style1">Account #2 :</span>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="TextBox3" ErrorMessage="必填（不可空白）/B2群組" ForeColor="Blue"
                SetFocusOnError="True" ValidationGroup="B2"></asp:RequiredFieldValidator>
            <br />
            <span class="style1">Password #2 :
            </span>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="TextBox4" ErrorMessage="必填（不可空白）/B2群組" ForeColor="Blue"
                SetFocusOnError="True" ValidationGroup="B2"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button1 -- 只驗證#1的TextBox"
                ValidationGroup="A1" />
            &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Button2 -- 只驗證#2的TextBox"
            ValidationGroup="B2" />
            <br />

        </div>
    </form>
</body>
</html>
