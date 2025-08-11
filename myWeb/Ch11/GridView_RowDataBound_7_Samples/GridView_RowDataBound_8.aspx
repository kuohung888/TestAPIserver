<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_8.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_8" %>

<!DOCTYPE html>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
            GridView的 <span class="style1">RowDataBound事件 #8</span><br />
            <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx">
                <span class="style2">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx</span></a>
            <br />
            <br />
            <br />
            <br />
            <strong><span class="style5">重點！！</span><span class="style6">GridView並沒有內建的功能按鈕（編輯、刪除、選取等等）</span></strong><br />
            <br />
            <br />
            <b>GridView裡面，只列出五筆記錄。<span class="style6">裡面的樣版，放了一個 PlaceHolder。</span><br />
            </b>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="id" DataSourceID="SqlDataSource1" >
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
                SelectCommand="SELECT top 5 [id], [title], [test_time] FROM [test]"></asp:SqlDataSource>
            <br />

        </div>
    </form>
</body>
</html>
