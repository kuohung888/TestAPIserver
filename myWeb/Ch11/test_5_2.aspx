<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_5_2.aspx.cs" Inherits="Ch11_test_5_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: small;
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
            INNER JOIN test_talk </span>ON test"<br />
            <br />
            <br />
            <br />
            手動合併「表頭」的欄位，<span style="font-size: 14pt; color: #ff0000; background-color: #ffff33"><strong>並且合併
            Row（第二版）<br />
                <br />
            </strong></span><span><span class="style1">&nbsp;&nbsp;&nbsp; 
        因為「手動合併ROW」的緣故，GridView原本的「<span
            style="color: #ff0000"><strong>隔列變色</strong>(&lt;AlternatingRowStyle&gt;)</span>」功能將會錯亂！<br />
                <br />
                <strong>&nbsp;&nbsp;&nbsp; 手動刪除</strong>這一行HTML碼----&nbsp; &lt;<span style="color: #ff0000">AlternatingRowStyle</span>
                BackColor="#F7F7F7"&gt;</span></span><br />
            <br />
            &nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id,t_id"
            DataSourceID="SqlDataSource1" Font-Size="Small" GridLines="Horizontal"
            AllowSorting="True" OnPreRender="GridView1_PreRender">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id">
                    <ItemStyle Font-Bold="True" ForeColor="Red" />
                </asp:BoundField>
                <asp:BoundField DataField="test_time" DataFormatString="{0:d}" HeaderText="test_time"
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
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
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />

        </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                SelectCommand="SELECT test.id, test.test_time, test.title, test.summary, test_talk.id AS t_id, test_talk.test_id, test_talk.test_time AS t_test_time, test_talk.article AS t_article, test_talk.author AS t_author, test_talk.email AS t_email FROM test INNER JOIN test_talk ON test.id = test_talk.test_id order by test.id"></asp:SqlDataSource>
    </div>
    </form>

</body>
</html>
