<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Update_4_Calendar4_sender_AllenKuo.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Update_4_Calendar2_sender_AllenKuo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .style2
        {
            font-size: large;
        }
        .auto-style2 {
            background-color: #FFFF00;
        }
        .auto-style3 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <p>
        &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <strong><span class="style2">.FindControl()方法 #4-4&nbsp; (Allen Kuo)</span></strong><br />
    </p>
    <p>
        資料來源 <a href="http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201409172008273OL.html">http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201409172008273OL.html</a> </p>
        <p>
        1. 兩個欄位請<strong>設定為「樣版」</strong>。<span class="auto-style3"><strong>先按下「編輯」，點選DropDownList</strong>可以抓到<strong>「這一列」</strong>另一欄位TextBox的值！</span></p>
    <p>
        2. 
        不使用 .FindControl()方法，改用<strong><span class="auto-style2"> sender來做</span></strong>。</p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="class" SortExpression="class">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("class") %>'></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        請先選我：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="class" DataValueField="class" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="font-weight: 700; color: #FF0000">
                        </asp:DropDownList>
                        (AutoPostBack)<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT DISTINCT [class] FROM [test]"></asp:SqlDataSource>
                    
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("class") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="title" SortExpression="title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([class], [title]) VALUES (@class, @title)" SelectCommand="SELECT [id], [class], [title] FROM [test]" UpdateCommand="UPDATE [test] SET [class] = @class, [title] = @title WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="title" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
