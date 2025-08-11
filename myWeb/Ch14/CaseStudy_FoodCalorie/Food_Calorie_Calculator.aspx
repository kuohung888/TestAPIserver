<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Food_Calorie_Calculator.aspx.cs" Inherits="Book_Sample_Ch14_CaseStudy_FoodCalorie_Food_Calorie_Calculator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>食物的卡路里計算</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b>食物的卡路里計算</b><br />
        資料來源：<a href="http://health.nkfust.edu.tw/svelte/sveltep3.htm">http://health.nkfust.edu.tw/svelte/sveltep3.htm</a>&nbsp;
    </div>
    <p>
        請挑選：<asp:DropDownList ID="DropDownList1" runat="server"
            DataSourceID="SqlDataSource1" DataTextField="food_name" DataValueField="id" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="-1">請選擇---</asp:ListItem>
        </asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [food_name], [id] FROM [Food_Calorie]">
        </asp:SqlDataSource>
        
&nbsp;&nbsp;&nbsp; 
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        份量：<asp:TextBox ID="TextBox1" runat="server" Width="38px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="計算卡路里~" onclick="Button1_Click" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        卡路里：<asp:Label ID="Label1" runat="server" style="color: #FF0000"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="food_name" HeaderText="food_name" 
                    SortExpression="food_name" />
                <asp:BoundField DataField="food_unit" HeaderText="food_unit" 
                    SortExpression="food_unit" />
                <asp:BoundField DataField="food_Calorie" HeaderText="food_Calorie" 
                    SortExpression="food_Calorie" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Food_Calorie]"></asp:SqlDataSource>
    </p>
    </form>
 
</body>
</html>

