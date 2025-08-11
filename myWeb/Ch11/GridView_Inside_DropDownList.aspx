<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Inside_DropDownList.aspx.cs" Inherits="Book_Sample_Ch11_GridView_Inside_DropDownList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        選取某一列紀錄之後，進入編輯模式。<br />
        而且帶出這筆紀錄相關的「讀者留言」。<br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:TemplateField>

                    <EditItemTemplate>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                            CellPadding="4" DataSourceID="SqlDataSource2" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="test_id" HeaderText="test_id" 
                                    SortExpression="test_id" />
                                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                                    SortExpression="test_time" />
                                <asp:BoundField DataField="article" HeaderText="article" 
                                    SortExpression="article" />
                                <asp:BoundField DataField="author" HeaderText="author" 
                                    SortExpression="author" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
                            SelectCommand="SELECT [test_id], [test_time], [article], [author] FROM [test_talk] WHERE ([test_id] = @test_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" Name="test_id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </EditItemTemplate>

                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
            DeleteCommand="DELETE FROM [test] WHERE [id] = @id" 
 
            SelectCommand="SELECT [id], [test_time], [class], [title], [summary], [article], [author] FROM [test]" 
            UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
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
        <br />
    
    </div>
    </form>
</body>
</html>
