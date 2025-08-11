<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListView_ItemDataBound.aspx.cs" Inherits="Book_Sample_Ch12_ListView_ListView_ItemDataBound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    	ListView的寫法跟Gridview有些不同<br />
		<br />
		<strong>ItemDataBound事件</strong><br />
    
    </div>
    	<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" GroupItemCount="3" OnItemDataBound="ListView1_ItemDataBound">
			<AlternatingItemTemplate>
				<td runat="server" style="background-color:#FFF8DC;">id:
					<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
					<br />name:
					<asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
					<br />student_id:
					<asp:Label ID="student_idLabel" runat="server" Text='<%# Eval("student_id") %>' />
					<br />city:
					<asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
					<br />chinese:
					<asp:Label ID="chineseLabel" runat="server" Text='<%# Eval("chinese") %>' />
					<br />math:
					<asp:Label ID="mathLabel" runat="server" Text='<%# Eval("math") %>' />
					<br /></td>
			</AlternatingItemTemplate>
			<EditItemTemplate>
				<td runat="server" style="background-color:#008A8C;color: #FFFFFF;">id:
					<asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
					<br />name:
					<asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
					<br />student_id:
					<asp:TextBox ID="student_idTextBox" runat="server" Text='<%# Bind("student_id") %>' />
					<br />city:
					<asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
					<br />chinese:
					<asp:TextBox ID="chineseTextBox" runat="server" Text='<%# Bind("chinese") %>' />
					<br />math:
					<asp:TextBox ID="mathTextBox" runat="server" Text='<%# Bind("math") %>' />
					<br />
					<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
					<br />
					<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
					<br /></td>
			</EditItemTemplate>
			<EmptyDataTemplate>
				<table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
					<tr>
						<td>No data was returned.</td>
					</tr>
				</table>
			</EmptyDataTemplate>
			<EmptyItemTemplate>
<td runat="server" />
			</EmptyItemTemplate>
			<GroupTemplate>
				<tr id="itemPlaceholderContainer" runat="server">
					<td id="itemPlaceholder" runat="server"></td>
				</tr>
			</GroupTemplate>
			<InsertItemTemplate>
				<td runat="server" style="">name:
					<asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
					<br />student_id:
					<asp:TextBox ID="student_idTextBox" runat="server" Text='<%# Bind("student_id") %>' />
					<br />city:
					<asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
					<br />chinese:
					<asp:TextBox ID="chineseTextBox" runat="server" Text='<%# Bind("chinese") %>' />
					<br />math:
					<asp:TextBox ID="mathTextBox" runat="server" Text='<%# Bind("math") %>' />
					<br />
					<asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
					<br />
					<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
					<br /></td>
			</InsertItemTemplate>
			<ItemTemplate>
				<td runat="server" style="background-color:#DCDCDC;color: #000000;">id:
					<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
					<br />name:
					<asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
					<br />student_id:
					<asp:Label ID="student_idLabel" runat="server" Text='<%# Eval("student_id") %>' />
					<br />city:
					<asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
					<br />chinese:
					<asp:Label ID="chineseLabel" runat="server" Text='<%# Eval("chinese") %>' />
					<br />math:
					<asp:Label ID="mathLabel" runat="server" Text='<%# Eval("math") %>' />
					<br /></td>
			</ItemTemplate>
			<LayoutTemplate>
				<table runat="server">
					<tr runat="server">
						<td runat="server">
							<table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
								<tr id="groupPlaceholder" runat="server">
								</tr>
							</table>
						</td>
					</tr>
					<tr runat="server">
						<td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
							<asp:DataPager ID="DataPager1" runat="server" PageSize="6">
								<Fields>
									<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
								</Fields>
							</asp:DataPager>
						</td>
					</tr>
				</table>
			</LayoutTemplate>
			<SelectedItemTemplate>
				<td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">id:
					<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
					<br />name:
					<asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
					<br />student_id:
					<asp:Label ID="student_idLabel" runat="server" Text='<%# Eval("student_id") %>' />
					<br />city:
					<asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
					<br />chinese:
					<asp:Label ID="chineseLabel" runat="server" Text='<%# Eval("chinese") %>' />
					<br />math:
					<asp:Label ID="mathLabel" runat="server" Text='<%# Eval("math") %>' />
					<br /></td>
			</SelectedItemTemplate>
		</asp:ListView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>
    </form>
</body>
</html>
