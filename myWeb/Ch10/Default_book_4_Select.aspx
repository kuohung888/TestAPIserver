<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_4_Select.aspx.cs" Inherits="Ch10_Default_book_4_Select" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>按下「選取(Select)」按鈕之後，出現對應test資料表的 Primary Key</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        按下「<strong><span style="text-decoration: underline">選取(<span style="color: #ff0000">Select</span>)</span></strong>」按鈕之後，出現對應test資料表的<span><strong> Primary
            Key（id欄位）</strong>。<br />
            <br />
            如果是自己制定的按鈕（CommandName=&quot;my_Button&quot;），則無效<br />
        </span>
        <ul>
            <li><span style="color: #0000ff"><strong>GridView1.SelectedValue</strong></span></li>
            <li><span></span><span style="color: #0000ff"><strong>GridView1.SelectedDataKey</strong></span></li>
        </ul>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Font-Size="Small" AutoGenerateSelectButton="True"
            OnRowCommand="GridView1_RowCommand"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:ButtonField ButtonType="Button" Text="自訂按鈕" CommandName="my_button" DataTextField="id" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" DataFormatString="{0:d}" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
            </Columns>
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [test_time], [title], [author] FROM [test]"></asp:SqlDataSource>

    </div>
    </form>

</body>
</html>
