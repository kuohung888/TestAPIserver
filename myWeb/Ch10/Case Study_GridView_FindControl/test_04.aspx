<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_04.aspx.cs" Inherits="Book_Sample_Ch10_test_04" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #006600;
        }
        .style2
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    GridView「裡面」的子控制項（如Button、DropDownList），如何觸發子控制項的事件？<b>#3</b><br />自己增加一欄<span 
            class="style1"> 資料行（按鈕） </span><br /><hr />
        <br />
        1). 自己編輯資料行，並加入一欄「自訂按鈕」。<br />
        2). 設定為「樣版」。<br />
        3). 修改HTML原始碼，把按鈕的 <b>CommandName設定為 &lt;% # Eval(&quot;id&quot;)&nbsp; %&gt;</b><br />
        4). 修改HTML原始碼，把按鈕的 <b>Command<span class="style2">Argument</span>設定為 &lt;% #
        <span class="style2">Container.DataItemIndex</span> %&gt;</b>。（代表每一列的 RowIndex）<br />    
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            onrowcommand="GridView1_RowCommand">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>

                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="sex" DataValueField="sex" 
                            SelectedValue='<%# Eval("sex") %>' 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>&nbsp;
                             
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" 
                            CommandName='<%# Eval("id") %>' 
                            CommandArgument='<%# Container.DataItemIndex %>'
                            Text="自訂按鈕" />                       

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="real_name" HeaderText="real_name" SortExpression="real_name" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="password" HeaderText="password" 
                    SortExpression="password" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="rank" HeaderText="rank" SortExpression="rank" />
            </Columns>
            <SelectedRowStyle BackColor="#FFFF99" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
            DeleteCommand="DELETE FROM [db_user] WHERE [id] = @id" 
            SelectCommand="SELECT * FROM [db_user]" 
            UpdateCommand="UPDATE [db_user] SET [real_name] = @real_name, [name] = @name, [password] = @password, [sex] = @sex, [email] = @email, [rank] = @rank WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="real_name" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="rank" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
