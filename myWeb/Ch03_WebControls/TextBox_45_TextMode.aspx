<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_45_TextMode.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_45_TextMode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ASP.NET 4.5 for <strong><span class="style1">HTML5</span><br class="style1" />
        </strong>
        <br />
        Color --
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Color"></asp:TextBox>
        <br />
        Email --
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Email"></asp:TextBox>
        <br />
        Url -----
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Url"></asp:TextBox>
        <br />
        DateTime<asp:TextBox ID="TextBox4" runat="server" TextMode="DateTime"></asp:TextBox>
        <br />
        Range --
        <asp:TextBox ID="TextBox5" runat="server" TextMode="Range"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
        <br />
        <br />
        不同的瀏覽器，對於 HTML5的支援不同，所以您會看見不同的成果。<br />
        <br />
        建議您安裝多款瀏覽器、最好都升級為最新版本。<br />
    </div>
    </form>
</body>
</html>
