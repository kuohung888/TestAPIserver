<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_3_2_Manual.aspx.cs" Inherits="Book_Sample_Ch09_Default_book_3_2_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>同一支程式，兩個GridView</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            color: #FFFFCC;
            background-color: #0033CC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>同一支程式，兩個GridView #2&nbsp;&nbsp;<span class="style2"> 稍微寫一點程式</span></h3>
        <hr />
        開啟了 GridView1的「選取（Select）」按鈕，就必須<span class="style1">關閉 </span>
        EnableSortingAndPagingCallBack屬性<br /><br /><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" 
        DataKeyNames="id" DataSourceID="SqlDataSource1" Font-Size="Small" PageSize="5" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
            BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" 
                HeaderText="test_time" SortExpression="test_time" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                <ItemStyle Font-Bold="True" Font-Size="Medium" />
            </asp:BoundField>
            <asp:BoundField DataField="summary" HeaderText="summary" 
                SortExpression="summary" />
        </Columns>
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
        SelectCommand="SELECT [id], [test_time], [title], [summary] FROM [test]">
    </asp:SqlDataSource>


        <!-- --------------------------------------------------------------------------------------------------------- -->
        <p class="style1">底下的 GrdiView2，請讓 DataSourceID屬性為「空白」（不設定）</p>


    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Font-Size="Small"
        CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="test_time" HeaderText="test_time" 
                SortExpression="test_time" />
            <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="summary" HeaderText="summary" 
                SortExpression="summary" />
            <asp:BoundField DataField="article" HeaderText="article" 
                SortExpression="article" />
            <asp:BoundField DataField="author" HeaderText="author" 
                SortExpression="author" />
            <asp:BoundField DataField="hit_no" HeaderText="hit_no" 
                SortExpression="hit_no" />
            <asp:BoundField DataField="get_no" HeaderText="get_no" 
                SortExpression="get_no" />
            <asp:BoundField DataField="email_no" HeaderText="email_no" 
                SortExpression="email_no" />
            <asp:BoundField DataField="approved" HeaderText="approved" 
                SortExpression="approved" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
 
 
</body>
</html>
