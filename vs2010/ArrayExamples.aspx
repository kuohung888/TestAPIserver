<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArrayExamples.aspx.cs" Inherits="ArrayExamples" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .array-example {
            text-align: center;
            margin: 40px auto;
            font-size: 1.5em;
        }
        .array-example h2 {
            color: #2c3e50;
        }
        .array-example button {
            padding: 6px 12px;
            font-size: 1em;
        }

         .container {
         max-width: 600px;
         margin: 0 auto;
         background: white;
         padding: 20px 30px;
         border-radius: 8px;
         box-shadow: 0 0 15px rgba(0,0,0,0.1);

    </style>
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="PlaceHolder1" runat="server">
    <div class="container">
    <div class="array-example">
        <h3>陣列操作方法範例集</h3>
   
        <asp:DropDownList ID="ddlExamples" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0">請選擇範例</asp:ListItem>
            <asp:ListItem Value="1">1. 陣列初始化與基本操作</asp:ListItem>
            <asp:ListItem Value="2">2. 多維陣列轉換</asp:ListItem>
            <asp:ListItem Value="3">3. 自訂排序(氣泡排序法)</asp:ListItem>
            <asp:ListItem Value="4">4. LINQ查詢應用</asp:ListItem>
            <asp:ListItem Value="5">5. 陣列過濾與轉換</asp:ListItem>
            <asp:ListItem Value="6">6. 陣列統計分析</asp:ListItem>
            <asp:ListItem Value="7">7. 不規則陣列操作</asp:ListItem>
            <asp:ListItem Value="8">8. 陣列緩衝區操作</asp:ListItem>
            <asp:ListItem Value="9">9. 安全陣列複製</asp:ListItem>
            <asp:ListItem Value="10">10. 陣列序列化</asp:ListItem>
        </asp:DropDownList>
        
        <div class="example-box">
            <asp:Literal ID="ltOutput" runat="server" />
        </div>
 
 
    </div>
   </div>     
</asp:Content>