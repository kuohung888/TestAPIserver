<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_inside_DropDownList_2_Manual.aspx.cs" Inherits="Book_Sample_Ch11_GridView_inside_DropDownList_2_Manual" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>科學小飛俠 (1.1) -- 自己動手寫程式</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            background-color: #66FFFF;
        }
        .style3
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b>仿照上一支程式，</b>但<span class="style1">自己寫程式</span>去控制（不能分頁）<br />
        <br />
        HTML碼裡面，<span class="style2"><span class="style3">沒有</span>資料繫結運算式（DataBinding 
        Expression）</span>，因為要自己寫程式去控制它。<br />
        <hr />
        <br />
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id"
             GridLines="Vertical" PageSize="5" DatasourceID="SqlDataSource1"
            ForeColor="Black">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="real_name" HeaderText="real_name"
                    SortExpression="real_name" />
                <asp:TemplateField HeaderText="sex" SortExpression="sex">
                    <ItemTemplate>
                    
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [real_name], [sex] FROM [db_user]"
            UpdateCommand="UPDATE [db_user] SET [real_name] = @real_name, [sex] = @sex WHERE [id] = @id">
            <UpdateParameters>
                <asp:Parameter Name="real_name" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
