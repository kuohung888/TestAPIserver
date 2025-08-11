<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownList_Zero_1.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_DropDownList_Zero_DropDownList_Zero_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        使用 Address資料表（三個），底下三個下拉式選單都<strong>啟動AutoPostBack</strong><br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="city_name" DataValueField="a1_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [Address_1]"></asp:SqlDataSource>
    
    </div>
        <p>
            ===============================</p>
        <p>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="district_name" DataValueField="a2_id">
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
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="street_name" DataValueField="a3_id" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
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
