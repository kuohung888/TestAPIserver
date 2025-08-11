<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03.aspx.cs" Inherits="Ch18_FileUpload_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>檔案上傳 ＃3</title>
    <style type="text/css">
        .style1
        {
            background-color: #FFCC99;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
            background-color: #FFFFFF;
        }
        .style3
        {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <h4>檔案上傳 ＃3 (Select a file to upload) :</h4>
        <p><span class="style3">請您先開啟 </span><span class="style2">c:\temp\uploads\</span><span 
                class="style3">的目錄，程式才能完成上傳</span></p>
   
            請先選取檔案，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
       </asp:FileUpload>
            
       <br /><br />
       
       <asp:Button id="Button1" Text="檔案上傳" runat="server" onclick="Button1_Click">
       </asp:Button>    
       <br />
        <span class="style1">本程式會先檢查檔案大小，必須小於 0.5MB才能上傳。 </span>
       
       <hr />
       
       <asp:Label id="Label1" runat="server"></asp:Label>    

    </div>
    </form>
 
</body>
</html>
