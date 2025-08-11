<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Street_Address_01.aspx.cs" Inherits="Book_Sample_Ch09_DropDownList_Street_Address_Street_Address_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #006600;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style3
        {
            color: #FFFFFF;
            background-color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>郵局的地址查詢（連動功能）<span class="style3"> 有 Bug </span></b>
        <br />
        請搭配 Address_01 ~_03 三個關連式資料表。<br />
        <span class="style2">因為設定了 DropDownList的「AppendDataBoundItems」屬性，重複選擇時，會讓子選項不斷累加</span><br />
        <br />
        <br />
        <span class="style1">設定 AutoPostBack與AppendDataBoundItems</span><br />
        縣市：<asp:DropDownList ID="DropDownList1" runat="server" 
            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" 
            DataTextField="city_name" DataValueField="a1_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="0">請選擇 --</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [a1_id], [city_name] FROM [Address_1]">
        </asp:SqlDataSource>
        <br />
        <br />
        <span class="style1">設定 AutoPostBack與AppendDataBoundItems</span><br />
        區域：<asp:DropDownList ID="DropDownList2" runat="server" 
            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" 
            DataTextField="district_name" DataValueField="a2_id">
            <asp:ListItem Value="0">請選擇--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Address_2] WHERE ([a1_id] = @a1_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="a1_id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <span class="style1">設定 AppendDataBoundItems</span><br />
        道路：<asp:DropDownList ID="DropDownList3" runat="server" 
            AppendDataBoundItems="True" DataSourceID="SqlDataSource3" 
            DataTextField="street_name" DataValueField="a3_id">
            <asp:ListItem Value="0">請選擇--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Address_3] WHERE ([a2_id] = @a2_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="a2_id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Button_確認" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <br />
        結果：<asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; color: #CC0000"></asp:Label>
    
    </div>
    </form>
</body>
</html>
