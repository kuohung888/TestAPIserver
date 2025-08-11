<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_Setting_PageLoad_02.aspx.cs" Inherits="Book_Sample_CaseStudy_Street_Address_Test_03_Setting_PageLoad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>後置程式碼，設定DropDownList的「預設值」</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
    後置程式碼，設定DropDownList的「預設值」--- OK版
        <br />
        <br />
        <br />
        <br />
            
        縣市：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="city_name" DataValueField="a1_id" OnDataBound="DropDownList1_DataBound">
        </asp:DropDownList>
        &nbsp;(AutoPostBack)<span class="auto-style1">*** 重點！！不要用 .SelectedItem.Text來做，這裡出錯了！ ***</span>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Address_1]"></asp:SqlDataSource>
        <br />
        <br />
        鄉鎮區：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="district_name" DataValueField="a2_id">
        </asp:DropDownList>
        &nbsp;(AutoPostBack)
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [Address_2]">

        </asp:SqlDataSource>
        <br />
        <span class="auto-style1">*** 重點！！SqlDataSource2 <strong>不可以</strong>有參數 &lt;SelectParameters&gt;！！ ***</span><br class="auto-style1" />
        <span class="auto-style1">不然的話，無法在後置程式碼「設定」某一個子選項為「預設值」。</span><br />
        <br />
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
