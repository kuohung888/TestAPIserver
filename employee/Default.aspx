<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="employee._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" Height="144px" Width="845px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
        <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
        <asp:BoundField DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate" />
        <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EmployeeDBConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @original_EmployeeID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Position] = @original_Position AND [Department] = @original_Department AND [HireDate] = @original_HireDate AND [Salary] = @original_Salary" InsertCommand="INSERT INTO [Employees] ([FirstName], [LastName], [Position], [Department], [HireDate], [Salary]) VALUES (@FirstName, @LastName, @Position, @Department, @HireDate, @Salary)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [FirstName] = @FirstName, [LastName] = @LastName, [Position] = @Position, [Department] = @Department, [HireDate] = @HireDate, [Salary] = @Salary WHERE [EmployeeID] = @original_EmployeeID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Position] = @original_Position AND [Department] = @original_Department AND [HireDate] = @original_HireDate AND [Salary] = @original_Salary">
    <DeleteParameters>
        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
        <asp:Parameter Name="original_FirstName" Type="String" />
        <asp:Parameter Name="original_LastName" Type="String" />
        <asp:Parameter Name="original_Position" Type="String" />
        <asp:Parameter Name="original_Department" Type="String" />
        <asp:Parameter DbType="Date" Name="original_HireDate" />
        <asp:Parameter Name="original_Salary" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="Position" Type="String" />
        <asp:Parameter Name="Department" Type="String" />
        <asp:Parameter DbType="Date" Name="HireDate" />
        <asp:Parameter Name="Salary" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="Position" Type="String" />
        <asp:Parameter Name="Department" Type="String" />
        <asp:Parameter DbType="Date" Name="HireDate" />
        <asp:Parameter Name="Salary" Type="Decimal" />
        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
        <asp:Parameter Name="original_FirstName" Type="String" />
        <asp:Parameter Name="original_LastName" Type="String" />
        <asp:Parameter Name="original_Position" Type="String" />
        <asp:Parameter Name="original_Department" Type="String" />
        <asp:Parameter DbType="Date" Name="original_HireDate" />
        <asp:Parameter Name="original_Salary" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
