<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormView_FileUpload_02_SqlDataSource_Manual.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FormView_FileUpload_02_SqlDataSource_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            color: #009900;
        }
        .auto-style3 {
            color: #FFFFCC;
        }
        .auto-style4 {
            background-color: #800000;
        }
    </style>
</head>
<body>
    <p>
        自己寫 SqlDataSource的後置程式碼（<span class="auto-style1"><strong>不建議這樣做</strong></span>，就讓他以精靈的身份來做事，不要為他寫程式碼）<br />
    </p>
    <p>
        既然需要自己寫程式了，FormView裡面 <strong>&quot;<span class="auto-style1">新增</span>樣版（<span class="auto-style1">Insert</span>ItenTemplate）&quot;</strong>的 DataBinding Expression我都手動取消了。&nbsp;
    </p>
    <p>
        重點在於 <span class="auto-style3"><strong><span class="auto-style4">SqlDataSource，請您看一下他的「原始檔」與標籤。我幾乎全數刪除了。</span></strong></span>
    </p>
    <p class="auto-style2">
        <strong>1. 您要學會上集，Ch. 6~8章，會自己修改「樣版」。</strong>
    </p>
    <p class="auto-style2">
        <strong>2. Ch. 10 GridView「新增」功能的小技巧，並自己寫ADO.NET程式（例如，上集 Ch. 13 / 14兩章）</strong>
    </p>
    <p class="auto-style2">
        <strong>3. 大型控制項的「身體」裡面，會用到方法，請看上集 Ch. 10 第十章。</strong>
    </p>
    <p class="auto-style2">
        <strong>4. 檔案上傳 (FileUpload)，上集 Ch. 18。</strong>
    </p>
    ===========================================================<br />
    <form id="form1" runat="server">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="FileUpload_DB_id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="400px" OnItemInserting="FormView1_ItemInserting">
            <InsertItemTemplate>
                FileUpload_time:
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px"
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px"
                    Width="220px" ShowGridLines="True">
                    <DayHeaderStyle BackColor="#FFCC66" Height="1px" Font-Bold="True" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
                <br />
                test_id:
                <asp:TextBox ID="test_idTextBox" runat="server" />
                <br />

                **************************************************<br />
                FileUpload_FileName:
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                **************************************************<br />

                FileUpload_Memo:
                <asp:TextBox ID="FileUpload_MemoTextBox" runat="server" />
                <br />
                FileUpload_User:
                <asp:TextBox ID="FileUpload_UserTextBox" runat="server" />
                <br />
                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>

            <ItemTemplate>
                FileUpload_DB_id:
                <asp:Label ID="FileUpload_DB_idLabel" runat="server" Text='<%# Eval("FileUpload_DB_id") %>' />
                <br />
                FileUpload_time:
                <asp:Label ID="FileUpload_timeLabel" runat="server" Text='<%# Bind("FileUpload_time") %>' />
                <br />
                test_id:
                <asp:Label ID="test_idLabel" runat="server" Text='<%# Bind("test_id") %>' />
                <br />
                FileUpload_FileName:
                <asp:Label ID="FileUpload_FileNameLabel" runat="server" Text='<%# Bind("FileUpload_FileName") %>' />
                <br />
                FileUpload_Memo:
                <asp:Label ID="FileUpload_MemoLabel" runat="server" Text='<%# Bind("FileUpload_Memo") %>' />
                <br />
                FileUpload_User:
                <asp:Label ID="FileUpload_UserLabel" runat="server" Text='<%# Bind("FileUpload_User") %>' />
                <br />
                <br />

                &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
            </ItemTemplate>
        </asp:FormView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT * FROM [FileUpload_DB] Order By FileUpload_DB_id DESC" OnInserted="SqlDataSource1_Inserted"></asp:SqlDataSource>
        <p>
            <asp:Label ID="Label1" runat="server" Style="font-weight: 700; background-color: #66FFFF"></asp:Label>
        </p>
        <p>
            &nbsp;
        </p>

    </form>
</body>
</html>
