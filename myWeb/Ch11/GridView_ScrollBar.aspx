<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_ScrollBar.aspx.cs" Inherits="Book_Sample_Ch11_GridView_ScrollBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF00;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        GridView加上 Scroll Bar的功能。</p>
    <p>
        直接添加 &lt;div&gt;即可，以下是CSS的寫法：<br />
    </p>
    <form id="form1" runat="server">
        <br />
            &lt;div<strong><span class="auto-style1"> style=&quot;</span></strong>height:150px; width:100px; <strong><span class="auto-style2">overflow:auto;</span><span class="auto-style1">&quot;</span></strong>&gt;
            <br /><br />

            <!-- ******************************************** -->
            <div style="height:150px; width:100px; overflow:auto;">

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                </Columns>
            </asp:GridView>

            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
         
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    <div>
    
    </div>
    </form>
</body>
</html>
