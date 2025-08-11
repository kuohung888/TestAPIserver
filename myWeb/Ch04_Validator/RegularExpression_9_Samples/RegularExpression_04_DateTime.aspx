<%@ Page Language="C#" Culture="en-US" AutoEventWireup="true" CodeFile="RegularExpression_04_DateTime.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_04_DateTime" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style6
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #4</strong><br />
        資料來源： <a href="http://msdn.microsoft.com/zh-tw/library/c8e9427h.aspx">
        http://msdn.microsoft.com/zh-tw/library/c8e9427h.aspx</a>
            
    </div>
    <p>
        在目前文化特性是<strong>英文 - 美國 (en-US)</strong> 的電腦上，請設定本網頁 <strong>&lt;% @ Page</strong> 
        ... <span class="style6"><strong>Culture=&quot;en-US&quot;</strong></span> ...</p>
    <p>
        下列程式碼範例會使用 <strong>Regex.Replace()方法</strong>，將具有<strong> mm/dd/yy 格式</strong>的日期取代成具有 <strong>
        dd-mm-yy 格式</strong>的日期。</p>
    <p>
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    
        </p>
    </form>
    </body>
</html>
