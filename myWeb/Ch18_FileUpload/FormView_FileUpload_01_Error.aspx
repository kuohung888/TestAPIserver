<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormView_FileUpload_01_Error.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FormView_FileUpload_01_Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <p>
        <h3>失敗的半成品.......</h3>
    </p>
    <p>
        &nbsp;知道畫面上的精靈設定，能做的<strong>有限（發現他的限制）。我們才會心甘情願的去寫程式.....</strong><br />
    </p>
    <p>
        &nbsp;
    </p>
    <form id="form1" runat="server">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="FileUpload_DB_id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="400px">
            <InsertItemTemplate>
                FileUpload_time:
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1"
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px"
                    SelectedDate='<%# Bind("FileUpload_time") %>' Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
                <br />
                test_id:
                <asp:TextBox ID="test_idTextBox" runat="server" Text='<%# Bind("test_id") %>' />
                <br />
                **************************************************<br />FileUpload_FileName:
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" Enabled='<%# Bind("FileUpload_FileName") %>' />
                <br />
                **************************************************<br />FileUpload_Memo:
                <asp:TextBox ID="FileUpload_MemoTextBox" runat="server" Text='<%# Bind("FileUpload_Memo") %>' />
                <br />
                FileUpload_User:
                <asp:TextBox ID="FileUpload_UserTextBox" runat="server" Text='<%# Bind("FileUpload_User") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
        </asp:FormView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            InsertCommand="INSERT INTO [FileUpload_DB] ([FileUpload_time], [test_id], [FileUpload_FileName], [FileUpload_Memo], [FileUpload_User]) VALUES (@FileUpload_time, @test_id, @FileUpload_FileName, @FileUpload_Memo, @FileUpload_User)"
            SelectCommand="SELECT * FROM [FileUpload_DB]">
            <InsertParameters>
                <asp:Parameter Name="FileUpload_time" Type="DateTime" />
                <asp:Parameter Name="test_id" Type="Int32" />
                <asp:Parameter Name="FileUpload_FileName" Type="String" />
                <asp:Parameter Name="FileUpload_Memo" Type="String" />
                <asp:Parameter Name="FileUpload_User" Type="String" />
            </InsertParameters>

        </asp:SqlDataSource>
        <p>
            &nbsp;
        </p>
        <div>
        </div>
    </form>
</body>
</html>
