<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10_Multi_Upload_Only45.aspx.cs" Inherits="CS_10_Multi_Upload_Only45" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <strong>.NET 4.5</strong>&nbsp;&nbsp;&nbsp; FileUpload新的屬性，<strong>AllowMultiple</strong><br />
        (抱歉！IE 9.0不能使用、不能同時選取多檔案)<br />
        <br />
        <br />
    
    大量檔案，批次上傳&nbsp; / 
        <span class="style1"><span class="style3">Only .NET 4.5！</span><br />
        </span> <br /><hr />
        &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
        <br />
        <br />
        <br />
        <hr />
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" 
            Text="Multi-Files ~ UPLOAD!  大量檔案，批次上傳！" OnClick="Button1_Click" />
    
    </div>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label><br />
    </p>
    </form>
</body>
</html>