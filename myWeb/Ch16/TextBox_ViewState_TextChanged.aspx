<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_ViewState_TextChanged.aspx.cs" Inherits="Book_Sample_Ch02_TextBox_ViewState_TextChanged" %>

<!DOCTYPE html >

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #0000FF;
            font-weight: bold;
        }
        .style3
        {
            color: #009900;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        取消&nbsp; TextBox的 ViewState（<span class="style1">EnableViewState屬性 = false</span>）<br />
        將無法判定 
        TextBox裡面的文字是否異動？而無法引發 TextChanged事件。<br />
        <br />
        參考資料： 
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.viewstate.aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.viewstate.aspx</a>
        <br />
        <span class="style3">伺服器控制項的檢視狀態（ViewState）是它<b>全部 [屬性值]</b>的累積。為了在 <b>HTTP 
        要求（Request）之間</b>保留這些值，ASP.NET 
        伺服器控制項使用這個屬性 (StateBag 類別的執行個體) 來儲存屬性值。然後這些值在處理後續的要求（Request）時，會當做變數傳遞給 HTML 
        隱藏輸入項目（如 &lt;input Type=Hidden....&gt;）。</span><br />
        <br />
        <br />
        執行步驟：<br />
        (1).&nbsp; 同時輸入一些文字，按下 Button按鈕。<br />
        <br />
        (2).&nbsp; 同時刪除原本的文字，重新按下 Button按鈕。<br />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" EnableViewState="False"
            OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        （<span class="style1">EnableViewState屬性 = false</span>）<br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
        <br />
        <br />
        ===========================================
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server"
            OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        （<span class="style2">EnableViewState屬性 = true。預設值</span>）<br />
        <br />
        <asp:Label ID="Label2" runat="server" Style="font-weight: 700; color: #0000FF"></asp:Label>
        <br />

    </div>
    </form>
</body>
</html>
