<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsView_Insert_FindControl.aspx.cs" Inherits="Book_Sample_Ch06_DetailsView_Insert_FindControl" %>

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
        <a href="http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD2013082421355650S.html">http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD2013082421355650S.html</a>
    </p>
    <p>
        新增會員資料以後，自動把「會員名稱(real_name)」帶入底下的FormView裡面</p>
    <p>
        需要用到 <strong>.FindControl()方法</strong><br />
    </p>
    <p>
        &nbsp;</p>
    <p class="auto-style1">
        紅字的部分，已經轉成「樣板（Template）」</p>
    <form id="form1" runat="server">
        <p>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="real_name" SortExpression="real_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("real_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("real_name") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("real_name") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="Red" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:TemplateField HeaderText="sex" SortExpression="sex">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sex") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("sex") %>'>
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("sex") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="Red" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:TemplateField HeaderText="rank" SortExpression="rank">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("rank") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("rank") %>'>
                                <asp:ListItem Selected="True">1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("rank") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="Red" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UpdateRight" SortExpression="UpdateRight">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UpdateRight") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" SelectedValue='<%# Bind("UpdateRight") %>'>
                                <asp:ListItem Selected="True" Value="Y">Yes</asp:ListItem>
                                <asp:ListItem Value="N">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("UpdateRight") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="Red" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DeleteRight" SortExpression="DeleteRight">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DeleteRight") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" SelectedValue='<%# Bind("DeleteRight") %>'>
                                <asp:ListItem Selected="True" Value="Y">Yes</asp:ListItem>
                                <asp:ListItem Value="N">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DeleteRight") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="Red" />
                    </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [db_user] WHERE [id] = @id" InsertCommand="INSERT INTO [db_user] ([real_name], [name], [password], [sex], [email], [rank], [UpdateRight], [DeleteRight]) VALUES (@real_name, @name, @password, @sex, @email, @rank, @UpdateRight, @DeleteRight)" SelectCommand="SELECT * FROM [db_user]" UpdateCommand="UPDATE [db_user] SET [real_name] = @real_name, [name] = @name, [password] = @password, [sex] = @sex, [email] = @email, [rank] = @rank, [UpdateRight] = @UpdateRight, [DeleteRight] = @DeleteRight WHERE [id] = @id" OnInserted="SqlDataSource1_Inserted">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="real_name" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="rank" Type="Int32" />
                    <asp:Parameter Name="UpdateRight" Type="String" />
                    <asp:Parameter Name="DeleteRight" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="real_name" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="rank" Type="Int32" />
                    <asp:Parameter Name="UpdateRight" Type="String" />
                    <asp:Parameter Name="DeleteRight" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            ==================================================================</p>
    <div>
    
        <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" DefaultMode="Insert" ForeColor="Black" GridLines="Vertical">
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                title:
                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
            </ItemTemplate>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([title]) VALUES (@title)" OnInserting="SqlDataSource2_Inserting" SelectCommand="SELECT [id], [title] FROM [test]" UpdateCommand="UPDATE [test] SET [title] = @title WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
