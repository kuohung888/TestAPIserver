<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_DB_Image_02_Display.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_Image_02_Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        把資料表 FileUpload_DB2裡面的「二進位」圖片，呈現出來！<br />
        <br />
        <br />
        === Repeater =====<br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>

                <asp:Image ID="Image1" runat="server" 
                    ImageUrl='<%# "FileUpload_DB_Image_02_Display.ashx?id=" + Eval("FileUpload_DB_id")%>' />
                
                <hr />

            </ItemTemplate>
        </asp:Repeater>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [FileUpload_DB_id]  FROM [FileUpload_DB2]">
        </asp:SqlDataSource>
    
        <br />
        <br />
        ===  GridView =====
        <h3>重點在於樣板裡面的 &lt;ImageField&gt;</h3>
        <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="FileUpload_DB_id" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="FileUpload_DB_id" HeaderText="FileUpload_DB_id" InsertVisible="False" ReadOnly="True" SortExpression="FileUpload_DB_id" />
                <asp:BoundField DataField="FileUpload_time" HeaderText="FileUpload_time" SortExpression="FileUpload_time" />
                <asp:BoundField DataField="FileUpload_MIME" HeaderText="FileUpload_MIME" SortExpression="FileUpload_MIME" />
                <asp:BoundField DataField="FileUpload_Memo" HeaderText="FileUpload_Memo" SortExpression="FileUpload_Memo" />
                <asp:BoundField DataField="FileUpload_User" HeaderText="FileUpload_User" SortExpression="FileUpload_User" />
                
                <asp:ImageField DataImageUrlField="FileUpload_DB_id" 
                    DataImageUrlFormatString="FileUpload_DB_Image_02_Display.ashx?id={0}">
                </asp:ImageField>

            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [FileUpload_DB_id], [FileUpload_time], [FileUpload_MIME], [FileUpload_Memo], [FileUpload_User] FROM [FileUpload_DB2]"></asp:SqlDataSource>
        <br />

    
    </div>
    </form>
</body>
</html>
