<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Delete_MultiRow_ALL_MSDN_JavaScript.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Delete_MultiRow_ALL_MSDN_JavaScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .style1
        {
            color: #FF0000;
        }
        .auto-style1 {
            background-color: #FF99FF;
        }
    </style>
</head>
<body>
    <p>
        批次刪除&nbsp; 多筆資料&nbsp;&nbsp; <strong><span class="auto-style1">JavaScript版（全選）</span></strong></p>
    <form id="form1" runat="server">
    <p>
        &nbsp;</p>
        <p>
            首先，把第一個欄位轉成「樣板」。</p>
        <p>
            再來，請在<strong>表頭樣板（Header）、內容樣板（ItemTemplate）</strong>都加入<strong>CheckBox控制項</strong>。</p>
        <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            PageSize="5" OnRowDataBound="GridView1_RowDataBound" OnRowCreated="GridView1_RowCreated">
            <Columns>
                <asp:TemplateField InsertVisible="False">
                    <HeaderTemplate>
                        <asp:CheckBox ID="CheckBox2_Header" runat="server" ForeColor="Red" Text="全選" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FFCC66" />
                    <ItemStyle BackColor="#FFCCFF" />
                </asp:TemplateField>

                <asp:BoundField DataField="id" HeaderText="id" 
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" DataFormatString="{0:d}" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="author" 
                    SortExpression="author" />
            </Columns>
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
    </p>
    <div>
    
        這個範例的 JavaScript碼是從微軟MSDN的下載網站上看見、學習的，特此致謝。<br />
        <span class="style1">如果<strong>第一個欄位（CheckBox）</strong>裡面，還有其他控制項（如Label），<strong>JavaScript全選的功能</strong>可能失效。</span></div>
    </form>

    <!-- ******************************************************************************** -->
    <!-- *** JavaScript寫在這裡，請把 CheckBox控制項「轉成HTML網頁之後」的ID，填寫進去即可。 -->
    <!-- ******************************************************************************** -->
    <script type="text/javascript">
        /* <![CDATA[ */
        
        function ConnectGridSelectAll(gridId) {
            if (navigator.userAgent.indexOf('Firefox') == -1) {  //FireFox瀏覽器專用。
                var table = document.getElementById(gridId);
                for (var i = 1; i < table.rows.length - 0; i++) {
                    table.rows[i].cells[0].children[0].checked = document.getElementById('GridView1_CheckBox2_Header').checked;
                }
            }
            else {   // 其他瀏覽器。
                var table = document.getElementById(gridId);
                for (var i = 0; i < table.rows.length; i++) {  //畫面上的表格(GridView)有幾列？
                    var chkboxID = '_CheckBox1_' + i;

                    var chkbox = document.getElementsByTagName('input');  // 畫面上有幾個<input>標籤？
                    for (var ii = 0; ii < chkbox.length; ii++) {
                        if (chkbox[ii].id.indexOf(chkboxID) != -1) {
                            chkbox[ii].checked = document.getElementById('GridView1_CheckBox2_Header').checked;
                        }
                    }
                }
            }
        }
        /* ]]> */
</script>


</body>
</html>
