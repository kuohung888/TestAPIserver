<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownList_Zero_4.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_DropDownList_Zero_DropDownList_Zero_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            color: #FF3399;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        使用 Address資料表（三個），底下三個下拉式選單都啟動AutoPostBack<br />
        <br />
        <span class="auto-style1"><strong>啟動 AppendDataBoundItem = true<br />
        <br />
        </strong></span>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" 
            DataTextField="city_name" DataValueField="a1_id" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>==請選擇==</asp:ListItem>
        </asp:DropDownList>
        &nbsp; <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [Address_1]"></asp:SqlDataSource>
    
    </div>
        <p>
            ===============================</p>
        <p>
        <span class="auto-style1"><strong>手動修改才能運作（加入自己選項以後，必須自己手動設定DataBinding）<br />
            &quot;後兩個&quot; DropDownList，預設的DataSourceID必須保持空白！！</strong></span></p>
        <p>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"
                DataTextField="district_name" DataValueField="a2_id"  AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem>==請選擇==</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [a2_id], [district_name] FROM [Address_2] WHERE ([a1_id] = @a1_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="a1_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            ***************************************</p>
        <p>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                DataTextField="street_name" DataValueField="a3_id"  AppendDataBoundItems="True"
                OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                <asp:ListItem>==請選擇==</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [Address_3] WHERE ([a2_id] = @a2_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="a2_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    </form>
</body>
</html>
