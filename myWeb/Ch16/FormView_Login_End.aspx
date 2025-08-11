<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormView_Login_End.aspx.cs" Inherits="Book_Sample_Ch16_FormView_Login_End" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <p>
        <br />
        登入成功以後，會自動把「使用者帳號」帶入 FormView裡面。</p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="561px">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    real_name:
                    <asp:TextBox ID="real_nameTextBox" runat="server" Text='<%# Bind("real_name") %>' />
                    <br />
                    name:
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    <br />
                    password:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    <br />
                    sex:
                    <asp:TextBox ID="sexTextBox" runat="server" Text='<%# Bind("sex") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    rank:
                    <asp:TextBox ID="rankTextBox" runat="server" Text='<%# Bind("rank") %>' />
                    <br />
                    UpdateRight:
                    <asp:TextBox ID="UpdateRightTextBox" runat="server" Text='<%# Bind("UpdateRight") %>' />
                    <br />
                    DeleteRight:
                    <asp:TextBox ID="DeleteRightTextBox" runat="server" Text='<%# Bind("DeleteRight") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    real_name:
                    <asp:TextBox ID="real_nameTextBox" runat="server" Text='<%# Bind("real_name") %>' />
                    <br />
                    name:
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    <br />
                    password:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    <br />
                    sex:
                    <asp:TextBox ID="sexTextBox" runat="server" Text='<%# Bind("sex") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    rank:
                    <asp:TextBox ID="rankTextBox" runat="server" Text='<%# Bind("rank") %>' />
                    <br />
                    UpdateRight:
                    <asp:TextBox ID="UpdateRightTextBox" runat="server" Text='<%# Bind("UpdateRight") %>' />
                    <br />
                    DeleteRight:
                    <asp:TextBox ID="DeleteRightTextBox" runat="server" Text='<%# Bind("DeleteRight") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    real_name:
                    <asp:Label ID="real_nameLabel" runat="server" Text='<%# Bind("real_name") %>' />
                    <br />
                    name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                    <br />
                    password:
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                    <br />
                    sex:
                    <asp:Label ID="sexLabel" runat="server" Text='<%# Bind("sex") %>' />
                    <br />
                    email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    rank:
                    <asp:Label ID="rankLabel" runat="server" Text='<%# Bind("rank") %>' />
                    <br />
                    UpdateRight:
                    <asp:Label ID="UpdateRightLabel" runat="server" Text='<%# Bind("UpdateRight") %>' />
                    <br />
                    DeleteRight:
                    <asp:Label ID="DeleteRightLabel" runat="server" Text='<%# Bind("DeleteRight") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [db_user] WHERE [id] = @id" InsertCommand="INSERT INTO [db_user] ([real_name], [name], [password], [sex], [email], [rank], [UpdateRight], [DeleteRight]) VALUES (@real_name, @name, @password, @sex, @email, @rank, @UpdateRight, @DeleteRight)" SelectCommand="SELECT * FROM [db_user]" UpdateCommand="UPDATE [db_user] SET [real_name] = @real_name, [name] = @name, [password] = @password, [sex] = @sex, [email] = @email, [rank] = @rank, [UpdateRight] = @UpdateRight, [DeleteRight] = @DeleteRight WHERE [id] = @id">
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
    <div>
    
    </div>
    </form>
</body>
</html>
