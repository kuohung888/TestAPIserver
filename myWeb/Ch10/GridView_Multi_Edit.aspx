<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Multi_Edit.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Multi_Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GridView批次修改 from MSDN網站</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        GridView批次修改 from MSDN網站<br />
        <br />
        <span style="color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); font-size: 16px;"><strong>逐步解說：對繫結至 GridView Web 伺服器控制項的資料列<span style="background-color: rgb(255, 255, 0);">執行大量更新</span></strong></span><br style="color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);" />
        <a href="http://msdn.microsoft.com/zh-tw/library/aa992036(v=vs.100).aspx" style="color: rgb(204, 102, 51); text-decoration: none; font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);" target="_blank"><strong>http://msdn.microsoft.com/zh-tw/library/aa992036%28v=vs.100%29.aspx</strong></a></div>
        <p>
            <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2012/01/13/gridview_multi_row_updating_20120113.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2012/01/13/gridview_multi_row_updating_20120113.aspx</a></p>
        <p style="padding: 0px 0px 15px; margin: 0px; color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
            1. 首先，要把<span class="Apple-converted-space">&nbsp;</span><strong>GridView + SqlDataSource的精靈步驟</strong>完成。</p>
        <p style="padding: 0px 0px 15px; margin: 0px; color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
            &nbsp;</p>
        <p style="padding: 0px 0px 15px; margin: 0px; color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
            2. 接著，把 GridView呈現資料的&nbsp;<span class="Apple-converted-space">&nbsp;</span><span style="color: rgb(255, 0, 0);"><strong>&lt;ItemTemplate&gt;改成 TextBox</strong></span>（並且完成<span style="color: rgb(255, 0, 0);"><strong>繫結、DataBinding</strong></span>），</p>
        <p style="padding: 0px 0px 15px; margin: 0px; color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
&nbsp;&nbsp;&nbsp; 讓用戶第一次看見畫面，就能修改每一個欄位。</p>
        <p style="padding: 0px 0px 15px; margin: 0px; color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
            &nbsp;</p>
        <p style="padding: 0px 0px 15px; margin: 0px; color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
            3. 真正的「批次刪除」、「批次修改」的 Button按鈕，寫在 GridView<strong><span style="color: rgb(255, 0, 0);">外面</span></strong>。</p>
        <p style="padding: 0px 0px 15px; margin: 0px; color: rgb(51, 51, 51); font-family: 'Trebuchet MS', Tahoma, Arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_對繫結至 GridView Web 伺服器控制項的資料列執行大量更新" />
        </p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />

                <asp:TemplateField HeaderText="test_time" SortExpression="test_time">
                    <ItemTemplate>
                        <asp:TextBox ID="test_timeTextBox" runat="server" Text='<%# Bind("test_time") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="title" SortExpression="title">
                    <ItemTemplate>
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            DeleteCommand="DELETE FROM [test] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [test] ([test_time], [title]) VALUES (@test_time, @title)" 
            SelectCommand="SELECT [id], [test_time], [title] FROM [test]" 
            UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" Visible="False">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    </form>
</body>
</html>
