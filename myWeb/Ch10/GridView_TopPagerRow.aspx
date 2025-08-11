<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_TopPagerRow.aspx.cs" Inherits="Book_Sample_Ch10_GridView_TopPagerRow" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>TopPagerRow屬性</strong>......注意！有另外一個 BottomPagerRow 屬性
        <br />
        <br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.toppagerrow.aspx#Y480">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.toppagerrow.aspx#Y480</a>
        <br />
        <br />
        <br />
        1. 請先設定 GridView的<strong>「PagerSetting」底下的 Position屬性 = top</strong><br />
        <br />
        2. 修改 <strong>PagerTemplate樣版</strong>，加入 DropDownList並設定 <strong>AutoPostBack=&quot;true&quot;</strong>
        <br />
        <br />
        3.<strong> 以 C#的方式，幫「樣版」裡面</strong>的下拉式選項(DropDownList)，<strong>設定 SelectedIndexChanged事件</strong><br />
        <br />
        4. 注意這個事件 (GridView的 <strong><span class="style2">DataBound事件</span></strong>)！<span
            class="style1"><strong>不</strong></span>是 <span class="style2">Row</span>DataBound事件喔～<br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="7" 
            ondatabound="GridView1_DataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
            </Columns>

            <PagerStyle ForeColor="Blue" BackColor="LightBlue" />
            <PagerSettings Position="Top" />

            <PagerTemplate>
                請挑選頁數：
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <br />

                <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
            </PagerTemplate>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title], [test_time] FROM [test]"></asp:SqlDataSource>
        <br />
    </div>
    </form>
</body>
</html>
