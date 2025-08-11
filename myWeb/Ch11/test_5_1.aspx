<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_5_1.aspx.cs" Inherits="Ch11_test_5_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>合併GridView「左邊」的第一行欄位</title>
    <style type="text/css">
        .style1
        {
            color: #0000FF;
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
        <strong>
            <span style="font-size: 14pt; color: #ff0000; background-color: #ffff33">合併</span><span
                style="font-size: 14pt; background-color: #ffff33" class="style1">左邊</span><span style="font-size: 14pt; color: #ff0000; background-color: #ffff33">
            第一行（Column），相同的 &quot;id編號&quot;，那幾列就會被合併！</span></strong><br />
        <span style="background-color: #99ffff"><strong>缺點</strong>：<span style="font-size: 11pt">1.&nbsp; 左邊第一個Table，"相同的文章內容"
            仍會出現數次！<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 2.&nbsp; 而且 GridView「隔行變色(&lt;AlternatingRowStyle&gt;)」功能會怪怪的<br />
        </span>
            <br />
            <br />
        </span>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="Blue" BorderStyle="Dotted"
            BorderWidth="3px" CellPadding="3" DataKeyNames="id,t_id" DataSourceID="SqlDataSource1"
            Font-Size="Small" ForeColor="Black" GridLines="Vertical"
            OnPreRender="GridView1_PreRender">
            <FooterStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" DataFormatString="{0:d}" HeaderText="test_time"
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                    <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
                <asp:BoundField DataField="t_id" HeaderText="t_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="t_id" />
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
