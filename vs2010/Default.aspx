<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
 
 
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" Runat="Server">
   
     <style type="text/css">
        /* 標題區 */
        .child-header h1 {
            text-align: center;
            color: #4a89dc;
            font-size: 2em;
            margin: 30px 0 20px;
        }

        /* 主要內容區 */
        .child-content {
            text-align: center;
            font-size: 1.2em;
            padding: 20px;
            background-color: #fafafa;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>

</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="PlaceHolder1" runat="server">
    <div class="child-header">
        <h1>ASP.NET C# 程式應用範例大全</h1>
    </div>
    <div class="child-content" style="background-color: lightcyan;">
        歡迎來到 ASP.NET C# 範例大全！<br />
        請從左側選單點選範例進行瀏覽與練習。
    </div>
</asp:Content>