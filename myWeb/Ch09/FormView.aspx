<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormView.aspx.cs" Inherits="Ch09_FormView" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        您想看哪一篇文章：
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="id" Font-Size="Small">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title], [summary], [article] FROM [test] ORDER BY [id], [test_time]"></asp:SqlDataSource>
        &nbsp; &nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        ======以下是 FormView======&nbsp;

        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2"
            ForeColor="#333333">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <InsertItemTemplate>
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>'>
                </asp:TextBox>
                <br />
                <br />
                summary:
               <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' Font-Size="Small" Height="100px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                <br />
                <br />
                article:
               <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' Font-Size="Small" Height="300px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="插入">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                </asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label><br />
                title:
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' Font-Bold="True" ForeColor="#FF0000"></asp:Label><br />
                summary:
                <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' Font-Italic="True" ForeColor="Gray" Font-Size="10pt"></asp:Label><br />
                article:
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("article") %>' Font-Size="Small" Height="300px" TextMode="MultiLine" Width="600px"></asp:TextBox><br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="編輯"></asp:LinkButton>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="刪除"></asp:LinkButton>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="新增"></asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>'></asp:Label><br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>'>
                </asp:TextBox><br />
                <br />
                summary:
               <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' Font-Size="Small" Height="100px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                <br />
                <br />
                article:
               <asp:TextBox ID="articleTextBox" runat="server" Text='<%# Bind("article") %>' Font-Size="Small" Height="300px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                <br />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="更新">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                </asp:LinkButton>
            </EditItemTemplate>
        </asp:FormView>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([title], [summary], [article]) VALUES (@title, @summary, @article)"
            SelectCommand="SELECT [id], [title], [summary], [article] FROM [test] WHERE ([id] = @id)" UpdateCommand="UPDATE [test] SET [title] = @title, [summary] = @summary, [article] = @article WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </div>
    </form>



</body>
</html>
