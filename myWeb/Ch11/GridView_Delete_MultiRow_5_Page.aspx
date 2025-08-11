<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Delete_MultiRow_5_Page.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Delete_MultiRow_5_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>批次刪除多筆資料 #5 （分頁）</title>
    <style type="text/css">
        .style1
        {
            color: #009900;
            background-color: #FFFF00;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            color: #FF0000;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            批次刪除&nbsp; 多筆資料&nbsp;&nbsp; #5<strong><span class="style1">（分頁 / 簡單的 </span>
                <span class="style3">重構</span><span class="style1">）</span></strong>
        </p>
        <p class="style2">
            請點選「要刪除的」、或是「原訂要刪除，但反悔要取消」的資料後，務必按下按鈕！
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="把勾選的那幾筆資料，刪除掉！" OnClick="Button1_Click" />
        </p>
        <p>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="id" DataSourceID="SqlDataSource1"
                PageSize="5" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
                BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="id(勾選,可刪除)" InsertVisible="False"
                        SortExpression="id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            &nbsp;
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="test_time" HeaderText="test_time"
                        SortExpression="test_time" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="summary" HeaderText="summary"
                        SortExpression="summary" />
                    <asp:BoundField DataField="author" HeaderText="author"
                        SortExpression="author" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
        </p>
        <p>
            您想刪除的那幾列（主索引鍵，P.K.）為：<asp:Label ID="Label2" runat="server"
                Style="color: #990033"></asp:Label>
        </p>
        <div>
        </div>
    </form>
</body>
</html>

