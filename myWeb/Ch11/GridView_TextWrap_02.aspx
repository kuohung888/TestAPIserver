<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_TextWrap_02.aspx.cs" Inherits="Book_Sample_Ch11_GridView_TextWrap_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #CCFF33;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            文字過長，自動換列（文字換列）<br />
            <br />
            針對英文字也有效。<br />
            <br />
            <br />
            <br />
            1. 先設定 title欄位的<strong>寬度為150px</strong><br />
            <br />
            2. <strong>Page_Load事件裡面，<span class="auto-style1">一列程式碼，設定 GridView即可</span></strong>（跟上一個範例不同），比較簡單！<br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"    
                DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" HeaderText="test_time" SortExpression="test_time" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                        <ItemStyle ForeColor="Blue" Width="150px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>

            <br />
            <br />
            ============================================<br />
            用來比對成果（不具備<span class="auto-style2"><strong>英文</strong></span>換列功能）<br />
            ----先設定 title欄位的<strong>寬度為150px 而且 Wrap = &quot;true&quot;<br />
            </strong><br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" HeaderText="test_time" SortExpression="test_time" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                        <ItemStyle ForeColor="Blue" Width="150px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <br />

        </div>
    </form>
</body>
</html>
