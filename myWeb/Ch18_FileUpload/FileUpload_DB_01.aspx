<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_DB_01.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF3300;
        }
        .style2
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>上傳的檔案路徑，會存在DB裡面</b>（<span class="style2">FileUpload_DB資料表</span>）<br />
        <br />
    
    </div>
    <div>請先選取檔案，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
       </asp:FileUpload>
            
       <br /><br />
       
       <asp:Button id="Button1" Text="檔案上傳" runat="server" onclick="Button1_Click">
       </asp:Button>    
       
       <hr />
       
       <asp:Label id="Label1" runat="server"></asp:Label>    
        </div>
    
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        <b><a href="FileUpload_DB_02_List.aspx">
        完成後，請連結到這個網頁（FileUpload_DB_02_List.aspx）看結果。</a></b></p>
    <p class="style1">
        程式碼會對照 &quot;副檔名清單&quot;，檢查上載檔案的副檔名，並拒絕所有其他類型的檔案。上傳的檔案，副檔名只能是 .jpg, .jpeg, .png, .gif 這四種</p>
    <p class="style1">
        檔案會寫入目前網站的 Uploads 資料夾中。</p>
    <p class="style1">
        上載檔案會以它在用戶端電腦上 ,相同檔案名稱來儲存。</p>
    
 
  
    </form>
    
     
</body>
</html>
