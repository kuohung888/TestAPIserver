<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormView_Article_BR.aspx.cs" Inherits="Book_Sample_FormView_Article_BR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文章的分段、段落</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        透過FormView來觀看一篇文章，如何讓「<strong>文章的分段、段落</strong>」呈現出來？</p>
    <p>
        1.&nbsp; 寫在 Page_Load裡面<span class="auto-style1"><strong>無效 </strong></span>（但是 DetailsView就有效！）<br />
        2.&nbsp; 寫在 <span class="auto-style1"><strong>DataBound事件</strong></span>內。</p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnDataBound="FormView1_DataBound" Width="640px">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    test_time:
                    <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                    <br />
                    class:
                    <asp:TextBox ID="classTextBox" runat="server" Text='<%# Bind("class") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    summary:
                    <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
                    <br />
                    article:
                    <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                    <br />
                    author:
                    <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    test_time:
                    <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>' />
                    <br />
                    class:
                    <asp:TextBox ID="classTextBox" runat="server" Text='<%# Bind("class") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    summary:
                    <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
                    <br />
                    article:
                    <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' />
                    <br />
                    author:
                    <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    test_time:
                    <asp:Label ID="test_timeLabel" runat="server" Text='<%# Bind("test_time") %>' />
                    <br />
                    class:
                    <asp:Label ID="classLabel" runat="server" Text='<%# Bind("class") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    summary:
                    <asp:Label ID="summaryLabel" runat="server" Text='<%# Bind("summary") %>' />
                    <br />
                    article:
                    <asp:Label ID="articleLabel" runat="server" style="font-weight: 700; color: #0000FF" Text='<%# Bind("article") %>' />
                    <br />
                    author:
                    <asp:Label ID="authorLabel" runat="server" Text='<%# Bind("author") %>' />
                    <br />

                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [class], [title], [summary], [article], [author] FROM [test]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
    <div>
    
    </div>
    </form>
</body>
</html>
