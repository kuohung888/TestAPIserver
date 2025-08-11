<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Delete_MultiRow_2.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Delete_MultiRow_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>批次刪除多筆資料 #2  （仍有小小缺失）</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #FF0000;
        }
        .style3
        {
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        批次刪除&nbsp; 多筆資料&nbsp;&nbsp; #2<span class="style1"><strong>（可以重複選擇、修改你想刪除的資料列</span><span 
            class="style3"> -- 仍有小小缺失</span><span class="style1">）</span></strong></p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="把勾選的那幾筆資料，刪除掉！" 
            onclick="Button1_Click" />
    </p>
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            PageSize="5">
            <Columns>
                <asp:TemplateField HeaderText="id(勾選,可刪除)" InsertVisible="False" 
                    SortExpression="id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        &nbsp;
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" DataFormatString="{0:d}" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" 
                    SortExpression="summary" />
                <asp:BoundField DataField="author" HeaderText="author" 
                    SortExpression="author" />
            </Columns>
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
    </p>
    <p>
        您想刪除的那幾列（主索引鍵，P.K.）為：<asp:Label ID="Label2" runat="server"></asp:Label>
    </p>
    <div>
    
        <span class="style2">缺點：</span><span class="style1">選取之後，換頁卻無法保存 CheckBox的勾選狀態。</span></div>
    </form>
</body>
</html>

