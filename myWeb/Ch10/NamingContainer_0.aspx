<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NamingContainer_0.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Inside_DropDownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        <br />
    </p>
    <p>
        =========================================================================</p>
    <p>
        GridView<strong>沒有 [選取]按鈕</strong></p>
    <p>
        身體裡面的 DropDownList被點選時，怎知道<strong>是<span class="auto-style1">「哪一列」的DropDownList</span>被選取</strong>呢？</p>
    <p>
        請參閱我這個範例的作法： <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2011/09/08/gridview_selectedindex_dataitemindex_rowcommand_2011.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2011/09/08/gridview_selectedindex_dataitemindex_rowcommand_2011.aspx</a> </p>
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" HeaderText="test_time" SortExpression="test_time" />
                    <asp:TemplateField HeaderText="title" SortExpression="title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>

                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Value="111">111_Text</asp:ListItem>
                                <asp:ListItem Value="222">222_Text</asp:ListItem>
                                <asp:ListItem Value="333">333_Text</asp:ListItem>
                                <asp:ListItem Value="444">444_Text</asp:ListItem>
                            </asp:DropDownList>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title], [author] FROM [test]"></asp:SqlDataSource>
        </p>
    <div>
    
    </div>
    </form>
</body>
</html>
