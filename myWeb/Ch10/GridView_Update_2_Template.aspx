<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Update_2_Template.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Update_2_Template" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FFCCCC;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            color: #000000;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong><span class="style3">.FindControl()方法 #2</span></strong><br />
    
        <b>
        <br />
        先改成 id與 title兩個欄位，轉成「<span class="style2">樣版</span>」</b><br />
    
        <br />
        <br />
        自己撰寫程式之前，先練習一下能否抓到 GridView<span class="style1">「編輯模式」底下的 &quot;值&quot;？<br />
        <br />
        </span><br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" 
            onrowupdating="GridView1_RowUpdating">

            <Columns>
                <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="title" SortExpression="title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [title] FROM [test]" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([title]) VALUES (@title)" UpdateCommand="UPDATE [test] SET [title] = @title WHERE [id] = @id">
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
    
        <br />
        請先設定好 GridView的<b>「DataKeyNames」屬性</b></div>
    </form>
</body>
</html>
