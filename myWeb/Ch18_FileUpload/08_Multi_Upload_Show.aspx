<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="08_Multi_Upload_Show.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_8_Multi_Upload_Show" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> FileUpload and Show the Pictures</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #003366;
            background-color: #FF99CC;
        }
        .style3
        {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    大量檔案，批次上傳&nbsp; / <span class="style1">本書獨有 FileUpload控制項&nbsp;&nbsp;&nbsp;&nbsp; </span> 
        <span class="style3"><span class="style2">
        <br />
        <br />
        上傳之後，立即呈現圖片！</span></span><br /><hr />
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
            Text="Multi-Files ~ UPLOAD!  大量檔案，批次上傳！---上傳之後，立即呈現圖片！" 
            onclick="Button1_Click" />
    
    </div>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label><br />
        <asp:Label ID="Label2" runat="server" ForeColor="darkblue"></asp:Label>
        <hr />
    <span class="style3"><span class="style2">上傳之後，立即呈現圖片！<br />
    <br />
    </span></span>
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
