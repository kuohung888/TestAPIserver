<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08_Multi_Upload_X1.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_08_Multi_Upload_X1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>在別本書看見的作法&nbsp; </strong>-- 多重檔案，批次上傳<br />
        <br />
        利用本書提供的「流水號」自動產生變數，來做改良。<br />
        <br />
    <div>
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
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
    </p>
    
    </div>
    </form>
</body>
</html>
