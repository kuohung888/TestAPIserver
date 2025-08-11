<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsView_Article_CSS.aspx.cs" Inherits="Book_Sample_Ch06_DetailsView_Article_CSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>透過CSS，做出三個「直式的欄位」，呈現新聞內容。</title>

	<style>
        /* section前面的 .符號，別忘了！ */

        .section {
            -moz-column-count: 3; /* Firefox */
            -webkit-column-count: 3; /* Safari and Chrome */
            column-count: 3;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    	透過CSS，做出三個「直式的欄位」，呈現新聞內容。<br />
		<br />
		========================================<br />
		1. 先加入CSS。<br />
		2. 將article欄位轉成樣板。<br />
		<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="641px">
			<Fields>
				<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
				<asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
				<asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
				<asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />

				<asp:TemplateField HeaderText="article" SortExpression="article">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("article") %>'></asp:TextBox>
					</EditItemTemplate>
					<InsertItemTemplate>
						<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("article") %>'></asp:TextBox>
					</InsertItemTemplate>

					<ItemTemplate>

						    <div class="section">
								<asp:Label ID="Label1" runat="server" Text='<%# Bind("article") %>'></asp:Label>
							</div>
												
					</ItemTemplate>
					<ItemStyle BackColor="#FFCCFF" />
				</asp:TemplateField>

				<asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
			</Fields>
		</asp:DetailsView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title], [summary], [article], [author] FROM [test]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
