<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_4_User_Control_4.aspx.cs" Inherits="Ch11_Default_book_4_User_Control_4" %>

<!--  **** 重點在此！！ *********************  -->
<%@ Register TagPrefix="MIS2000Lab" TagName="DataGrid2" Src="Default_book_4_UserControl_2.ascx"  %>
<!--  **** 重點在此！！ *********************  -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> 大腸包小腸 #2 </title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            font-weight: bold;
            text-decoration: underline;
            background-color: #66FFFF;
        }
        .style3
        {
            background-color: #66FFFF;
        }
        .style4
        {
            color: #000099;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <span class="style1">&nbsp;大腸包小腸（單一GridView的Master-Detail功能）  
        <br />
        </span>
        <br />
        &nbsp;大的GridView用來展示 Master<br />
        &nbsp;裡面包含一個小的GridView（使用者控制項），用來展示Detail
        <br />
        <br />
        <span class="style4"><span class="style2">完成版 </span><span class="style3">，分頁、排序都OK！ </span></span>
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id"
            DataSourceID="SqlDataSource1" Font-Size="Small" GridLines="Horizontal"
            AllowPaging="True" AllowSorting="True" AutoGenerateSelectButton="True"
            PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowCreated="GridView1_RowCreated"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnSorting="GridView1_Sorting">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                    ReadOnly="True" SortExpression="id">
                    <ItemStyle Font-Bold="True" ForeColor="Red" />
                </asp:BoundField>
                <asp:BoundField DataField="test_time" HeaderText="test_time"
                    SortExpression="test_time" DataFormatString="{0:d}">
                    <ItemStyle ForeColor="Blue" />
                </asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="title（文章標題）"
                    SortExpression="title">
                    <ItemStyle Font-Bold="True" Font-Size="Medium" ForeColor="Navy" />
                </asp:BoundField>
                <asp:BoundField DataField="summary" HeaderText="summary(摘要)"
                    SortExpression="summary">
                    <ItemStyle ForeColor="Orange" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#ACFFAC" ForeColor="#4A3C8C" HorizontalAlign="Center" Font-Bold="True" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#006A00" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#ACFFAC" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title], [summary]) VALUES (@test_time, @title, @summary)"
            SelectCommand="SELECT [id], [test_time], [title], [summary] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title, [summary] = @summary WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
    </div>
    </form>

</body>
</html>


