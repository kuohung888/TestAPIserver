<%@ Page Language="C#" AutoEventWireup="true" CodeFile="4_Manual_Insert.aspx.cs" Inherits="Ch06_4_Manual_Insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>使用最基本、最原始的Web控制項，從頭開始打造一個資料輸入（新增）的畫面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    使用最基本、最原始的Web控制項，從頭開始打造一個資料輸入（新增）的畫面
    <hr />
    
        <br />
        日期：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        （日期格式-- yyyy/MM/dd）<br />
        <br />
        標題：<asp:TextBox ID="TextBox2" runat="server" Width="334px"></asp:TextBox>
        <br />
        <br />
        分類：<asp:TextBox ID="TextBox3" runat="server" Width="62px"></asp:TextBox>
        <br />
        <br />
        摘要：<asp:TextBox ID="TextBox4" runat="server" Width="334px"></asp:TextBox>
        <br />
        <br />
        內容：<asp:TextBox ID="TextBox5" runat="server" Height="133px" Width="334px" 
            TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        作者：<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
    
    </div>
    <P align="center"><asp:Button ID="Button1" runat="server" Text="Submit / 新增一筆資料" 
            onclick="Button1_Click" /></p>
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
        
        InsertCommand="INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author]) VALUES (@test_time, @class, @title, @summary, @article, @author)" >
        
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" DbType="DateTime" Name="test_time" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="class" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox3" Name="title" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox4" Name="summary" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox5" Name="article" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox6" Name="author" PropertyName="Text" Type="String" />
        </InsertParameters>
        
    </asp:SqlDataSource>
    
    
     <div>
    
        <span class="style3">注&nbsp; 意!!</span><br />
        如果採用SQL 2005，請將HTML碼裡面的 SqlDataSource參數稍做修改。<br />
        &lt;asp:Parameter <span class="style2">DbType=&quot;Datetime&quot;</span> Name=&quot;test_time&quot; /&gt;<br />
        <br />
        如果採用SQL 2008，則寫成 &lt;asp:Parameter <span class="style1">DbType=&quot;Date&quot;</span> 
        Name=&quot;test_time&quot; /&gt;</div>   
    </form>
 
</body>
</html>
