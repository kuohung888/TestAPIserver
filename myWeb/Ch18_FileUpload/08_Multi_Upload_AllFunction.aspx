<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08_Multi_Upload_AllFunction.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_8_Multi_Upload_AllFunction" %>

<!DOCTYPE html> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #800000;
        }
        .style3
        {
            font-size: large;
            font-weight: bold;
        }
        .style4
        {
            background-color: #66FFFF;
        }
        .style5
        {
            color: #0000CC;
            font-weight: bold;
        }
    </style>
</head>
<body bgcolor="#ffff99">
    <form id="form1" runat="server">
    <div>
        <span class="style3">大量檔案，批次上傳</span><span class="style5"> #2<br />
            <br />
            FileUpload控制項<span class="style4"> (批次上傳 + 各種功能的混合)</span></span><span class="style1"><br />
                <br />
            </span><span class="style2">
                <br />
                <br />
            </span>
        <br />
        <hr />
        1.
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        2.
        <asp:FileUpload ID="FileUpload2" runat="server" />
        <br />
        3.
        <asp:FileUpload ID="FileUpload3" runat="server" />
        <br />
        4.
        <asp:FileUpload ID="FileUpload4" runat="server" />
        <br />
        5.
        <asp:FileUpload ID="FileUpload5" runat="server" />
        <br />
        <hr />
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" 
            Text="Multi-Files ~ UPLOAD!  大量檔案，批次上傳！" onclick="Button1_Click" />
    </div>
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label><br />
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" ForeColor="Blue"></asp:Label><br />
    </p>
    <p>
        <hr />
        <span class="style3"><span class="style2">上傳之後，立即呈現圖片！</span></span>        
        <br />
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" Visible="False" />&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image2" runat="server" Visible="False" />&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image3" runat="server" Visible="False" /><br /><br />
        <asp:Image ID="Image4" runat="server" Visible="False" />&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image5" runat="server" Visible="False" />
    </p>
    </form>
</body>
</html>
