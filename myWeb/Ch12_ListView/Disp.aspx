<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disp.aspx.cs" Inherits="Book_Sample_CaseStudy_DIY_Disp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> 查看某一篇文章細部內容 </title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
            <asp:Label ID="Label1_title" runat="server" 
                style="font-weight: 700; font-size: xx-large; color: #0033CC"></asp:Label>
    </div>
    <hr />
    <asp:Label ID="Label2_summary" runat="server" 
        style="color: #666666; font-style: italic;"></asp:Label>
    <br />
    <div align="right">
        發表日期：<asp:Label ID="Label3_test_time" runat="server" 
            style="font-style: italic; color: #993333"></asp:Label>
    </div>   
    <hr />
    <br />
    <asp:Label ID="Label4_article" runat="server"></asp:Label>
    <hr />
    <div align="right">
        作者：<asp:Label ID="Label5_author" runat="server"></asp:Label>
    </div>        
    <hr />
    <br />
    </form>
</body>
</html>

