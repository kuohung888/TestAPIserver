<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Page_CommandName_3.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Page_CommandName_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            background-color: #FFFF00;
        }
        .style3
        {
            font-size: large;
        }
        .style4
        {
            background-color: #66FF33;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        自己設定「分頁」的 CommandName = &quot;Page&quot; <strong><span class="style3">#3</span></strong><br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.buttonfield.commandname.aspx">
            http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.buttonfield.commandname.aspx</a>
        <br />
        <br />
        若要叫用分頁，請將 <strong>CommandName 設定為 &quot;Page&quot;</strong>，<br />
        並將所包含之 Button 控制項的 <strong>Command</strong><span class="style1"><strong>Argument</strong></span><strong>
            設定為 &quot;First&quot;、&quot;Last&quot;、&quot;Prev&quot;、&quot;Next&quot; </strong>
        或<strong>頁碼</strong>。<br />
        <br />
        <br />
        (1). 自己設定分頁按鈕，放在 PagerTemplate樣版內。<br />
        (2). 分頁按鈕，需要設定上面的 <strong>CommandName</strong>與 <strong>Command</strong><span class="style1"><strong>Argument</strong></span>兩者。<br />
        <span class="style2">(3). 解決一個 Bug，第一頁時，按鈕不可出現。最後一頁亦然。</span><br />
        <br />
        <br />
        <br />
        務必將 按鈕的「if」判別程式寫在 GridView1_<strong><span class="style4">DataBound事件</span></strong>內！！<br />
        重點：注意！<span class="style1"><strong>不是 Row</strong></span>DataBound事件喔～<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" BackColor="White"
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ondatabound="GridView1_DataBound" 
            onpageindexchanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <PagerTemplate>
                <asp:Button ID="Button1" runat="server" CommandArgument="Prev" CommandName="Page"
                    Text="Button1_Prev" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" CommandArgument="Next" CommandName="Page"
                    Text="Button2_Next" />
            </PagerTemplate>
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server" Style="color: #0066CC; font-weight: 700" Text="Label"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
