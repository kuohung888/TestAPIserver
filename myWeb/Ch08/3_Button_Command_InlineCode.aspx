<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Button控制項，CommandName屬性的範例（Inline Code）</title>

        <script runat="server">
              void CommandBtn_Click(Object sender, CommandEventArgs e) 
              {
                 switch(e.CommandName)
                 {
                    case "Sort":
                       Sort_List((String)e.CommandArgument);
                       break;

                    default:
                       // The command name is not recognized. Display an error message.
                       Message.Text = "你按下哪個按鈕？我不認得～.";
                       break; 
                 }
              }


              void Sort_List(string commandArgument)
              {
                 switch(commandArgument)
                 {
                    case "Ascending":
                       Message.Text = "你按下「排序」的按鈕！CommandArgument為 Ascending";
                       break;

                    case "Descending":     
                       Message.Text = "你按下「反排序」的按鈕！ CommandArgument為 Descending ";
                       break;
                 }
              }
        </script>
    <style type="text/css">
        .style1
        {
            background-color: #FFFF00;
        }
    </style>
</head>

<body>
   <form id="form1" runat="server">
      <h3>按下不同的按鈕，會出現不同的狀態<span class="style1">（Inline Code）</span></h3>
      <br /><br />
      <asp:Button id="Button1" runat="server"
           Text="排序（由大到小）"
           CommandName="Sort"   CommandArgument="Ascending"
           OnCommand="CommandBtn_Click" />
           <!-- 註解： onCommand 表示按下這個按鈕，將會執行的程式名稱？
例如：將會執行 CommandBtn_Click() 這支程式-->
      &nbsp;
      <asp:Button id="Button2" runat="server"
           Text="反排序（由小到大）"
           CommandName="Sort"   CommandArgument="Descending"
           OnCommand="CommandBtn_Click" />
      <br /><br />
      <asp:Label id="Message" runat="server"/>
   </form>
</body>
</html>

