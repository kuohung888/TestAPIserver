<%@ Page Language="C#" AutoEventWireup="true" CodeFile="3_Button_Command_CodeBehind.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_3_Button_Command_CodeBehind" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Button控制項，CommandName屬性的範例（Code Behind）</title>

    <style type="text/css">
        .style1
        {
            background-color: #000099;
            color: #66FFFF;
        }
    </style>
</head>

<body>
   <form id="form1" runat="server">
      <h3>按下不同的按鈕，會出現不同的狀態<span class="style1">（Code Behind）</span></h3>
      <br /><br />

      <asp:Button id="Button1" runat="server" Text="排序（由大到小）"
           CommandName="Sort"   CommandArgument="Ascending" 
          oncommand="CommandBtn_Click" />
           <!-- 註解： onCommand 表示按下這個按鈕，將會執行的程式名稱？
例如：將會執行 CommandBtn_Click() 這支程式-->
      &nbsp;

      <asp:Button id="Button2" runat="server" Text="反排序（由小到大）"
           CommandName="Sort"   CommandArgument="Descending" 
          oncommand="CommandBtn_Click" />

      <br /><br />
      <asp:Label id="Message" runat="server"/>
   </form>
</body>
</html>
