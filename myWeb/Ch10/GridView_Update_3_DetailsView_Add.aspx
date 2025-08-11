<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Update_3_DetailsView_Add.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Update_3_DetailsView_Add" %>

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
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        <strong><span class="style2">.FindControl()方法 #3</span></strong><br />
    </p>
    <p>
        1. test_time欄位請<strong>設定為「樣版」</strong>。</p>
    <p>
        2. 新增樣版裡面，原本TextBox保留，但設定<span class="auto-style1"><strong> ReadOnly = true。</strong></span></p>
    <p class="auto-style1">
        <strong>並加入一個 Calendar，在「SelectionChanged事件」裡面寫程式。</strong></p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="640px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="test_time" SortExpression="test_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_time") %>' ReadOnly="true"></asp:TextBox>
                        (ReadOnly)<br />
                        <br />
                        點選以下日曆，日期會自動寫回TextBox裡面<br /> 
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px"
                            CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399"
                            Height="200px" Width="220px" 
                            OnSelectionChanged="Calendar1_SelectionChanged">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_time", "{0:yyyy/MM/dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
                <asp:BoundField DataField="article" HeaderText="article" SortExpression="article" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            DeleteCommand="DELETE FROM [test] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author]) VALUES (@test_time, @class, @title, @summary, @article, @author)" 
            SelectCommand="SELECT [id], [test_time], [class], [title], [summary], [article], [author] FROM [test] Order by id DESC" 
            UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
                <asp:Parameter Name="author" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <div>
    
    </div>
    </form>
</body>
</html>
