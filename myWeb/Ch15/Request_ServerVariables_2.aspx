<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Request_ServerVariables_2.aspx.cs" Inherits="Ch15_Request_ServerVariables_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

a, div.contentbox h2
{
	color: #27baff;
}

a 
{
	text-decoration: none;
	font-size: 1.2em;
}

a, div.contentbox h2
{
	color: #ffba27;
}

        .style1
        {
            font-weight: bold;
            background-color: #000099;
        }
        .style2
        {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <a id="viewpost_ascx_TitleUrl" class="singleposttitle"
            href="http://www.dotblogs.com.tw/cloudio/archive/2008/11/07/5905.aspx"
            title="Title of this entry."><span class="style1">取得所有的ServerVariables</span></a><br />
        <span class="style2">資料來源：</span><a class="style2"
            href="http://www.dotblogs.com.tw/cloudio/archive/2008/11/07/5905.aspx">http://www.dotblogs.com.tw/cloudio/archive/2008/11/07/5905.aspx</a>
        <br />
        <br />
        <br />
        利用 foreach迴圈自動列出所有的 ServerVariables<br />

    </div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>

</body>
</html>
