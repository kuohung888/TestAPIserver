<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Food_Calorie_Calculator_multi.aspx.cs" Inherits="Book_Sample_Ch14_CaseStudy_FoodCalorie_Food_Calorie_Calculator_multi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>食物的卡路里計算#2</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b>食物的卡路里計算<span class="style1">（複選）</span></b><br />
        資料來源：<a href="http://health.nkfust.edu.tw/svelte/sveltep3.htm">http://health.nkfust.edu.tw/svelte/sveltep3.htm</a>&nbsp;
    </div>
    <p>
       請挑選：<span class="style1">(AutoPostBack)</span><asp:DropDownList 
            ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="food_name" 
            DataValueField="food_calorie" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True">
            <asp:ListItem Value="-1">請選擇---</asp:ListItem>
        </asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [food_name], [food_calorie] FROM [Food_Calorie]">
        </asp:SqlDataSource>
    </p>
    <p>
        您剛剛點選的食物：<span class="style1">(AutoPostBack)</span><asp:ListBox ID="ListBox1" 
            runat="server" AutoPostBack="True" 
            onselectedindexchanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
    &nbsp;點選 ListBox內容，可以「刪除」！<br/>
        卡路里：<asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <br />
    <hr />
    Total：<asp:Label ID="Label2" runat="server" style="color: #0000FF; background-color: #FFFF00;"></asp:Label>卡路里
    <p>
        &nbsp;</p>
    </form>
 
</body>
</html>
