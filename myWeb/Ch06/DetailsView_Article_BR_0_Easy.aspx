<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsView_Article_BR_0_Easy.aspx.cs" Inherits="Book_Sample_B10_CaseStudy_DIY_DetailsView_Article_BR_0_Easy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>文章的分段、段落</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <p>
        透過 DetailsView來觀看一篇文章，如何讓「<strong>文章的分段、段落</strong>」呈現出來？
    </p>
    <p>
        1.&nbsp; <span class="auto-style1"><strong>不需要寫程式</strong></span><br />
        2.&nbsp; 寫在 HTML畫面之中，必須把 <strong>Bind(&quot;欄位&quot;)</strong> 改成 <span class="auto-style1"><strong>Eval(&quot;欄位&quot;)</strong></span>才行。
        然後套用 <strong>.Replace()方法</strong>。</p>
    <form id="form1" runat="server">
        <p>
            <br />
            先把文章內文（article欄位）轉成 Template樣板
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="640px" CellSpacing="2">
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                    <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />


                    <asp:TemplateField HeaderText="article" SortExpression="article">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #0000FF"
                                Text='<%# Eval("article").ToString().Replace("\r\n", "<br />") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                </Fields>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                SelectCommand="SELECT [id], [test_time], [class], [title], [summary], [article], [author] FROM [test]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;
            另外一種寫法：</p>
        <p>
            &lt;asp:Label ID=&quot;Label1&quot; runat=&quot;server&quot;
        </p>
        <p>
            Text=&#39;<span class="auto-style2">&lt;%</span># <strong>DataBinder.Eval(</strong>Container.DataItem, <span class="auto-style2">&quot;article&quot;)</span>.ToString().Replace(&quot;\r\n&quot;, &quot;&lt;br /&gt;&quot;) <span class="auto-style2">%&gt;</span>&#39;&gt;&lt;/asp:Label&gt;</p>
        <p>
            &nbsp;
        <a href="http://msdn.microsoft.com/zh-tw/library/4hx47hfe(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/4hx47hfe(v=vs.110).aspx</a>
        </p>
        <div>
        </div>
    </form>
</body>
</html>
