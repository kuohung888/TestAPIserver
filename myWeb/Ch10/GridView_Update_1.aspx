<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="GridView_Update_1.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Update_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> 能否抓到 GridView「編輯模式」底下的 「值」？</title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FFCCCC;
        }
        .style2
        {
            font-weight: bold;
            background-color: #99CCFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>.Controls[index值]集合，稍有難度！</strong><br />
        <br />
        <br />
        自己撰寫程式之前，先練習一下能否抓到 GridView<span class="style1">「編輯模式」底下的 &quot;值&quot;？<br />
        </span>

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" 
            onrowupdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [title] FROM [test]">
        </asp:SqlDataSource>


        <br />
        <br />
        ===== 以下各欄位都轉成「樣版」=====<asp:GridView ID="GridView2" runat="server" AllowPaging="True"
            AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditButton="True"
            DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>

        <br />
        請先設定好 GridView的<span class="style2">「DataKeyNames」屬性</span></div>
    </form>
</body>
</html>
