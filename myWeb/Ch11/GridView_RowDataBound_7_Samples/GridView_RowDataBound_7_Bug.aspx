<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_7_Bug.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
        .style2
        {
            font-size: small;
        }
        .style5
        {
            color: #FFFFFF;
            background-color: #FF0000;
        }
        .style3
        {
            font-weight: bold;
            background-color: #FF99FF;
        }
        .style4
        {
            background-color: #FFFF99;
        }
        .style6
        {
            color: #FF0000;
        }
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        GridView的 <span class="style1">RowDataBound事件 #7</span><br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx">
        <span class="style2">
        http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx</span></a>
        <br />
        <br />
        您也可以參閱這個<b>範例</b>，瞭解 RowDataBound事件的原理。<br />
        <a href="http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx">
        <span class="style2">
        http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx</span></a>
        <br />
        <br />
        <br />
        <strong><span class="style5">重點！！</span><span class="style6">動態加入 PlaceHolder裡面</span></strong>的 <strong>
        Button按鈕的「CommandName」</strong>，必須放在 <span class="style3">RowCreated事件</span>才生效！<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 放在
        <b><span class="style4">RowDataBound事件</span></b>裡面無效。<br />
        <br />
        <br />
        <b>GridView裡面，只列出五筆記錄。<span class="style6">裡面的樣版，放了一個 PlaceHolder。</span><br />
        </b>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            AutoGenerateEditButton="True"  onrowcreated="GridView1_RowCreated" 
            onrowdatabound="GridView1_RowDataBound" >
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:TemplateField HeaderText="test_time" SortExpression="test_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test_time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_time") %>'></asp:Label>
                        <br />
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 [id], [title], [test_time] FROM [test]">
        </asp:SqlDataSource>
        <br />
        <br />
        <strong><span class="auto-style1">有一個嚴重的Bug --</span></strong><br />
        如果把<strong>畫面左邊</strong>（GridView內建的「編輯」按鈕取消），自己動態加入 PlaceHolder的「編輯」按鈕也會失效！<br />
        <br />
        解決方法：<br />
        方法一，把自己動態加入的「編輯」按鈕，<span class="style6"><strong>不要</strong></span>動態加上 ID屬性即可。。<br />
        方法二，請看下一個範例。<br />
    
    </div>
    </form>
</body>
</html>


