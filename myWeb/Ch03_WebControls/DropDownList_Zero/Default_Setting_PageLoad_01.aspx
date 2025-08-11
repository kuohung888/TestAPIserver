<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_Setting_PageLoad_01.aspx.cs" Inherits="Book_Sample_CaseStudy_Street_Address_Test_03_Setting_PageLoad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>後置程式碼，設定DropDownList的「預設值」</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    後置程式碼，設定DropDownList的「預設值」---錯誤版
        <br />
        <br />
        <br />
        <br />
    
        縣市：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="city_name" DataValueField="a1_id">
        </asp:DropDownList>
        &nbsp;(AutoPostBack)
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Address_1]"></asp:SqlDataSource>
        <br />
        <br />
        鄉鎮區：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="district_name" DataValueField="a2_id">
        </asp:DropDownList>
        &nbsp;(AutoPostBack)
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Address_2]  WHERE ([a1_id] = @a1_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="a1_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        程式裡面，已經設定第二個下拉式選單 .SelectedValue = &quot;12&quot;<br />
        但無效？？？？<br />
        <br />
        <br />
        路、街道：<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="street_name" DataValueField="a3_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Address_3] WHERE ([a2_id] = @a2_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="a2_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
