<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_DB_Image_03_2Display.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_ASHX_FileUpload_DB_Image_03_Display" %>

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
    <form id="form1" runat="server">
    <div>    
        第二種作法，搭配 Fileupload_DB<span class="auto-style1"><strong>3</strong></span>&nbsp; 改用&nbsp; <strong>varbinary(MAX)</strong>當作欄位的資料型態
        <br />
    <p> 資料來源：<a href="http://www.dotblogs.com.tw/shadow/archive/2011/06/12/28113.aspx">http://www.dotblogs.com.tw/shadow/archive/2011/06/12/28113.aspx</a>  </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
   
        把資料表 FileUpload_DB3裡面的「二進位」圖片，呈現出來！<br />
        <br />
        <br />
        === Repeater =====<br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>

                <asp:Image ID="Image1" runat="server" 
                    ImageUrl='<%# "FileUpload_DB_Image_03_2Display.ashx?id=" + Eval("FileUpload_DB_id")%>' />
                
                <hr />

            </ItemTemplate>
        </asp:Repeater>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [FileUpload_DB_id]  FROM [FileUpload_DB3]">
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
                
                <asp:ImageField DataImageUrlField="FileUpload_DB_id" 
                    DataImageUrlFormatString="FileUpload_DB_Image_03_2Display.ashx?id={0}">
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
            SelectCommand="SELECT *  FROM [FileUpload_DB3]"></asp:SqlDataSource>
        <br />

    
    </div>
    </form>
</body>
</html>
