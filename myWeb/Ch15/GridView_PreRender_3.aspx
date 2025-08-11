<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_PreRender_3.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_2_CaseStudy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>使用 student_test資料表，成績低於60分就會出現紅字</title>
    <style type="text/css">
        .style1
        {
            color: #99FF66;
            font-weight: bold;
            background-color: #006600;
        }
        .style2
        {
            font-size: small;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <br />
        改用 GridView的 <span class="auto-style2"><strong>PreRender事件來作</strong></span><br />
        <br />
        <br />
        <span class="auto-style2"><strong>使用 student_test資料表，成績低於60分就會出現紅字</strong></span><br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" OnPreRender="GridView1_PreRender" >
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="chinese" HeaderText="chinese" SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
             SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
