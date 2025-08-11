<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_6_2_RowState.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_6_2_RowState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #CC0099;
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
            GridView的 <span class="style1">RowDataBound事件 #6-2</span><br />
            <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx">
                <span class="style2">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx</span></a>
            <br />
            <br />
            <br />
            <span class="style6"><strong><span class="style7">靜態加入</span></strong></span>的按鈕。事先寫好在樣版裡面！<br />
            <br />
            <br />
            <b>GridView裡面，只列出五筆記錄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
                <span class="style5">重點！！第二、第四列的 Edit（編輯模式）如何判定？</span></strong><br />
            </b>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="id" DataSourceID="SqlDataSource1"
                AutoGenerateEditButton="True" BackColor="White" BorderColor="#CC9966"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                        ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="test_time" HeaderText="test_time"
                        SortExpression="test_time" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                SelectCommand="SELECT top 5 [id], [title], [test_time] FROM [test]"></asp:SqlDataSource>
            <br />

        </div>
    </form>
</body>
</html>
