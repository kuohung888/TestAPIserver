<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_DynamicTable.aspx.cs" Inherits="GridView_DynamicTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GridView的內容會變動，但身體裡面的Button是固定的。</title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button1_資料來源1" />
&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button2_資料來源2" />
        </p>
        <p>
            GridView的內容會變動，但身體裡面的Button是固定的。</p>
        <p>
            ====================================</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField ButtonType="Button" Text="按鈕" HeaderText="自訂欄位（ButtonField）" CommandName="Select" />
                    <asp:TemplateField HeaderText="自訂欄位（TemplateField）">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF3300"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </p>
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 10 [id], [test_time], [title], [hit_no] FROM [test]"></asp:SqlDataSource>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 10 * FROM [Food_Calorie]"></asp:SqlDataSource>
    </form>
</body>
</html>
