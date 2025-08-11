<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataSet_Concept_CS.aspx.cs" Inherits="_Book_New_Samples_DB_DataSet_DataSet_Concept_CS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            color: #000099;
        }
        .style3
        {
            color: #009933;
        }
        .style4
        {
            color: #FF0000;
        }
        .style5
        {
            font-weight: bold;
            background-color: #99CCFF;
        }
        .style6
        {
            font-weight: bold;
            background-color: #FFFF00;
        }
        .style7
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>DataSet Concept</b><br />
        透過三個 GridView來展示資料，看看資料新增與修改。 
        <br />
        <br />
        1.)&nbsp; 先看看第一個 GridView。展示目前 test資料表的內容（最後五筆紀錄）<br />
        2).&nbsp; 按下按鈕，<asp:Button ID="Button1" runat="server" 
            Text="Button_(Insert)新增一筆紀錄。還在DataSet裡面。" onclick="Button1_Click" /><br />
        3).&nbsp; 按下按鈕，<asp:Button ID="Button2" runat="server" 
            Text="Button_察看資料庫裡面，最新的紀錄" onclick="Button2_Click" />
        <br />
        <br />
        <br />
        <span class="style1">列出資料庫目前的最後五筆紀錄。</span><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id" 
            ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 * FROM [test] order by id DESC"></asp:SqlDataSource>

        <br /><br />
        <hr /><br />以下都是自己寫程式來處理：<br />
        <p>
        ===== <span class="style5">第一個按鈕 </span>
        ===========================================</p>
        <blockquote>
        <span class="style2">(1). 將 test資料庫的紀錄，放進 DataSet裡面。 </span>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id" 
            ForeColor="#333333" GridLines="None" CssClass="style2">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <br /><br />
        <hr /><b><span class="style3">(2). 新增一筆紀錄（一列資料列）到 DataSet裡面。</span><br 
            class="style3" />
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 只放在記憶體裡面，</span><span 
            class="style4">並未</span><span class="style3">真正寫回資料庫！</span></b><br />
  
         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    
        <br />
        </blockquote>
        <br />
        <br />
        <br />
        ===== <span class="style6">第二個按鈕 </span>
        ===========================================<br />
        新增的那一列紀錄，真正從 DataSet裡面<span class="style7">「回寫」到實體的資料庫</span>！<br />
  
         <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" DataKeyNames="id" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
