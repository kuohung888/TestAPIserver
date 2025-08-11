<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cookie_06.aspx.cs" Inherits="Ch16_Cookie_06" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
            font-size: small;
            color: #006666;
        }
        .style3
        {
            font-size: small;
            color: #006666;
            background-color: #FFFF00;
        }
        .style4
        {
            background-color: #FFFF00;
        }
        .style5
        {
            font-size: small;
            color: #FF0000;
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <br />
        本範例將會<span class="style1">讀取 Cookie_02.aspx的成果</span>，請您務必「先執行」Cookie_02.aspx一次！<br />
        <br />
        （建議您事先執行過前面的範例，如 Cookie_02.aspx）<br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <span class="style2">本程式執行結果如下：</span><br class="style2" />
        <span class="style2">Cookie’s Name is userName </span>
        <br class="style2" />
        <span class="style2">Value is MIS2000 Lab. </span>
        <br class="style2" />
        <span class="style2">________________________________________ </span>
        <br class="style2" />
        <span class="style2">Cookie’s Name is lastVisit </span>
        <br class="style2" />
        <span class="style2">Value is 2008/10/23 </span>
        <br class="style2" />
        <span class="style2">________________________________________</span><br
            class="style2" />
        <span class="style2">&nbsp;Cookie’s Name is userInfo </span>
        <br class="style2" />
        <span class="style2">&nbsp;<span class="style4">&nbsp;&nbsp;&nbsp; Subkey name 
        is userName </span></span><span class="style4">
            <br class="style2" />
        </span><span class="style3">&nbsp;&nbsp;&nbsp;&nbsp; Subkey value is Bill Gates
        </span><span class="style5">&nbsp;&nbsp;&nbsp;&nbsp; 
        這裡是跟上一隻程式(Cookie_05.aspx)最大的不同</span>
    </div>
    </form>

</body>
</html>
