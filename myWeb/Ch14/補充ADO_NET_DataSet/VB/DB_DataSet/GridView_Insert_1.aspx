<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GridView_Insert_1.aspx.vb" Inherits="test_GridView_GridView_Insert_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新增資料的幾種方法，#1</title>
    <style type="text/css">
        .style1
        {
            color: #0000FF;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1">方法一：SqlDataSource</span><br />
    
        <br />
        文章分類：<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>政治</asp:ListItem>
            <asp:ListItem>教育</asp:ListItem>
            <asp:ListItem>娛樂</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:DropDownList>
    
        <br />
        標題：<asp:TextBox ID="TextBox2" runat="server" Width="330px"></asp:TextBox>
        <br />
        摘要：<asp:TextBox ID="TextBox3" runat="server" Width="330px"></asp:TextBox>
        <br />
        文章內容：<asp:TextBox ID="TextBox4" runat="server" Height="250px" Width="300px" 
            TextMode="MultiLine"></asp:TextBox>
        <br />
        作者：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Button--新增" />
        <br />
    <hr />
    </div>
    <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
        GridLines="None" AutoGenerateColumns="False" DataKeyNames="id" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="test_time" HeaderText="test_time" 
                SortExpression="test_time" DataFormatString="{0:d}" />
            <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="summary" HeaderText="summary" 
                SortExpression="summary" />
            <asp:BoundField DataField="article" HeaderText="article" 
                SortExpression="article" />
            <asp:BoundField DataField="author" HeaderText="author" 
                SortExpression="author" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
        InsertCommand="INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author]) VALUES (getdate(), @class, @title, @summary, @article, @author)" 
        SelectCommand="SELECT top 5 * FROM [test] ORDER BY [id] DESC" >
        <InsertParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="class" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TextBox2" Name="title" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="TextBox3" Name="summary" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="TextBox4" Name="article" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="TextBox5" Name="author" PropertyName="Text" 
                Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    </form>
 
</body>
</html>
