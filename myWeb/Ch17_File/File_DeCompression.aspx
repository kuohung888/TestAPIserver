<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_DeCompression.aspx.cs" Inherits="Book_Sample_Ch17_File_File_DeCompression" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #66CCFF;
        }
        .style2
        {
            color: #FFFF00;
            background-color: #800000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <a href="http://msdn.microsoft.com/zh-tw/library/system.io.compression.gzipstream.aspx">
            http://msdn.microsoft.com/zh-tw/library/system.io.compression.gzipstream.aspx</a><br />
        <br />
        注意！<br />
        <span id="xn9_cceaa96135509d1643cb928767d4119b" class="sentence"></span><span id="xn10_66d232e68eef8dab9932c7e372717d70"
            class="sentence"><span xmlns="http://www.w3.org/1999/xhtml">&nbsp;&nbsp; <a href="http://msdn.microsoft.com/zh-tw/library/system.io.compression.deflatestream.aspx">
                DeflateStream</a></span> 和 <span xmlns="http://www.w3.org/1999/xhtml"><span class="selflink">
                    GZipStream</span></span> 類別的最佳使用方式是用於<b>未壓縮</b>的資料來源。<br />
            &nbsp;&nbsp; </span><span id="xn11_d1062415d769211c9718b02169879a1a" class="sentence">
                如果來源資料已經壓縮，使用這些類別可能會增加資料流的實際大小。</span><br />
        <br />
        <b>使用「</b><span class="style1">GZipStream</span><b>」來進行<span class="style2">「解」</span>壓縮</b><br />
        <br />
        <br />
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>
