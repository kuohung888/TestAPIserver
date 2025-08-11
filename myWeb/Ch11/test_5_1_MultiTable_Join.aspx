<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_5_1_MultiTable_Join.aspx.cs" Inherits="Ch11_test_5_1_MultiTable_Join" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>手動自訂新的「表頭」+ 合併「原有表頭」的欄位</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Inner Join----SQL指令，混合兩個關聯資料表<br />
        <br />
        SelectCommand=<br />
        <span style="font-size: 10pt">"SELECT test.id, test.test_time, ttest.title,
            test.summary, test_talk.id AS t_id, test_talk.test_id, test_talk.test_time AS t_test_time,
            test_talk.article AS t_article, test_talk.author AS t_author, test_talk.email AS
            t_email </span>
        <br />
        FROM <span style="color: #0033cc">t</span><span style="color: #ff0000"><span style="color: #0033cc">est
            INNER JOIN test_talk
            <br />
        </span>ON test.id = test_talk.test_id</span>"<br />

        <br />
        手動自訂新的「表頭」 +   <span class="style1">合併「原有表頭」的欄位</span><br />
        <hr />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid"
            BorderWidth="1px" CellPadding="3" DataKeyNames="id,t_id" DataSourceID="SqlDataSource1"
            Font-Size="Small" ForeColor="Black" GridLines="Vertical"
            OnRowCreated="GridView1_RowCreated">
            <FooterStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                    <ItemStyle Font-Bold="True" ForeColor="Red" />
                </asp:BoundField>
                <asp:BoundField DataField="test_time" DataFormatString="{0:d}" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                    <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
                <asp:BoundField DataField="t_id" HeaderText="t_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="t_id" />
                <asp:BoundField DataField="test_id" HeaderText="test_id" SortExpression="test_id">
                    <ItemStyle Font-Bold="True" ForeColor="Red" />
                </asp:BoundField>
                <asp:BoundField DataField="t_test_time" DataFormatString="{0:d}" HeaderText="t_test_time"
                    SortExpression="t_test_time" />
                <asp:BoundField DataField="t_article" HeaderText="t_article" SortExpression="t_article" />
                <asp:BoundField DataField="t_author" HeaderText="t_author" SortExpression="t_author" />
                <asp:BoundField DataField="t_email" HeaderText="t_email" SortExpression="t_email" />
            </Columns>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT test.id, test.test_time, test.title, test.summary, test_talk.id AS t_id, test_talk.test_id, test_talk.test_time AS t_test_time, test_talk.article AS t_article, test_talk.author AS t_author, test_talk.email AS t_email FROM test INNER JOIN test_talk ON test.id = test_talk.test_id order by test.id"></asp:SqlDataSource>

    </div>
    </form>

</body>
</html>
