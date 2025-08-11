<%@ Page Title="" Language="C#" MasterPageFile="~/Book_Sample/Ch16/MasterPage/MasterPage_Session.master" AutoEventWireup="true" CodeFile="1_Login_Session.aspx.cs" Inherits="Book_Sample_Ch16_MasterPage_1_Login_Session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- 註解：CSS的部分，寫在表頭（header）。  --> 
    <style type="text/css">

        .auto-style1 {
            background-color: #FFFF00;
        }
        .auto-style2 {
            color: #FF3300;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br /><br />
        <strong><span class="auto-style1">Session</span></strong>&nbsp; <span class="auto-style2"><strong>最常用在會員登入的身分檢查上面</strong></span>
    </p>
    <p>
        本範例的 帳號 123  與 密碼 123
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        密碼：<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Login..." OnClick="Button1_Click" />
    </p>
    <div>
    </div>

&nbsp;


</asp:Content>

