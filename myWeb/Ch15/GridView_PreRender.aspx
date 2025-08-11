<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_PreRender.aspx.cs" Inherits="GridView_RowDataBound_2_CaseStudy_PreRender" %>

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
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        改用 <strong>PreRender事件</strong>來作，在控制項呈現在畫面「<strong>之前</strong>」處理完畢。<br />
        <br />
        計算學生的「數學」總分（加總）<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="chinese" HeaderText="chinese" SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>

        <br />

    </div>
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #0066FF; font-size: large"></asp:Label>
        <br />
        <br />
        <br />
        MSDN說明： <br />
        <br />
        針對像是 GridView、DetailsView和 FormView的大型控制項，<br />
        在控制項的 「PreRender事件」期間會 “自動”解析資料繫結運算式，並且您 ”不”需要明確呼叫 .DataBind()方法。</form>
</body>
</html>
