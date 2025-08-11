<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="GridView_Update_0_Concept_1_Error.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Update_0_Concept_1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>能否抓到 GridView「編輯模式」底下的 「值」？</title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FFCCCC;
        }
        .style2
        {
            font-weight: bold;
            background-color: #99CCFF;
        }
        .auto-style1 {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <strong><span class="auto-style1">觀念#1</span>&nbsp;&nbsp; .Controls[index值]集合，稍有難度！</strong><br />
        <br />
        <br />
        為何無法在 Page_Load事件中，使用 .Controls[]集合???<br />
        <br />
        <br />
        <br />
        ===== 以下各欄位未經修改，維持原狀=====
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
            AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditButton="True"
            DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>


        <br />
    </div>
    </form>
</body>
</html>
