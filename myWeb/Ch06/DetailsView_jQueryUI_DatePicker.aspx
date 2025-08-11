<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsView_jQueryUI_DatePicker.aspx.cs" Inherits="Book_Sample_Ch06_DetailsView_jQueryUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>DetailsView + JQuery UI (DatePicker)</title>

    <!-- *** Start ************************************************************** -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  
  <script>
  $(function() {
      $("#DetailsView1_TextBox1").datepicker();
  });
  </script>
    <!-- *** End ************************************************************** -->

    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            background-color: #FFFF00;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        DetailsView + JQuery UI (DatePicker)<br />
        <br />
        直接進入編輯模式。DetailsView的<strong>DefaultMode = Edit</strong><br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" Height="288px" Width="432px" 
            DefaultMode="Edit">
            <EditRowStyle BackColor="#99CCFF" BorderColor="Blue" BorderStyle="Dotted" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="test_time" SortExpression="test_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_time") %>'></asp:TextBox>
                        <br />此欄位已經轉成樣板！
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_time") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_time") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#CCFF99" />
                </asp:TemplateField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title], [author]) VALUES (@test_time, @title, @author)" SelectCommand="SELECT [id], [test_time], [title], [author] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title, [author] = @author WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            1. 從執行畫面，檢查<strong>HTML原始碼</strong>，可以看出「日期欄位」的Name -- <span class="auto-style1"><strong>DetailsView1<span class="auto-style2">$</span>TextBox1&nbsp; </strong></span></p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp; ID -- <span class="auto-style1"><strong>DetailsView1<span class="auto-style2">_</span>TextBox1</strong></span></p>
        <p>
            2. 撰寫後置程式碼，利用<strong> .ClientID屬性</strong>來看，最精準！</p>
        <asp:Label ID="Label2" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    </form>
</body>
</html>
