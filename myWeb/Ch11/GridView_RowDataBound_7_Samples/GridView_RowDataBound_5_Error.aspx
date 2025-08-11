<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_5_Error.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_5_Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC00CC;
            font-weight: bold;
        }
        .style2
        {
            font-size: small;
        }
        .style3
        {
            font-weight: bold;
            background-color: #FF99FF;
        }
        .style4
        {
            background-color: #FFFF99;
        }
        .style5
        {
            color: #FFFFFF;
            background-color: #FF0000;
        }
        .style6
        {
            color: #FFFFFF;
        }
        .style7
        {
            background-color: #FF3300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        GridView的 <span class="style1">RowDataBound事件 #5</span><br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx">
        <span class="style2">
        http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx</span></a>
        <br />
        <br />
        <b><span class="style4">RowDataBound事件</span> </b>與 <span class="style3">RowCreated事件</span>的差異？？<br />
        <br />
        <br />
        <span class="style6"><strong><span class="style7">靜態加入</span></strong></span>的按鈕。事先寫好在樣版裡面！<br />
        <br />
        <b>GridView裡面，只列出五筆記錄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <span class="style5">重點！！為什麼按下自己設定的 Button按鈕之後，程式會犯錯？？？</span></strong><br />
        </b>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            AutoGenerateEditButton="True" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Horizontal" onrowcreated="GridView1_RowCreated" 
            onrowdatabound="GridView1_RowDataBound" >
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="title" SortExpression="title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                        <asp:Button ID="Button1" runat="server" Text="Button_Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 [id], [title], [test_time] FROM [test]">
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>

