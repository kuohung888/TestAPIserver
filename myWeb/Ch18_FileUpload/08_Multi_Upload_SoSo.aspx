<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08_Multi_Upload_SoSo.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_8_Multi_Upload_SoSo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style3
        {
            background-color: #FFCC00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    大量檔案，批次上傳&nbsp; / <span class="style1"><span class="style3">普通的寫法，給[初學者]用的！</span><br />
        </span> <br /><hr />
        1.
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        2.
        <asp:FileUpload ID="FileUpload2" runat="server" />
        <br />
        <br />
        <hr />
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" 
            Text="Multi-Files ~ UPLOAD!  大量檔案，批次上傳！" onclick="Button1_Click" />
    
    </div>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label><br />
        <asp:Label ID="Label2" runat="server" ForeColor="darkblue"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" ForeColor="darkblue" 
            style="color: #009933"></asp:Label>
    </p>
    </form>
</body>
</html>
