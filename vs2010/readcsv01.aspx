<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="readcsv01.aspx.cs" Inherits="AirQualityWeb.readcsv01" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
  <link href="Styles/style.css" rel="stylesheet" />

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="PlaceHolder1" runat="server">
<div class="container">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

    <h1>全台空氣品質偵測查詢系統</h1>

    <div class="filter-panel">
      <asp:Label ID="lblSite" runat="server" Text="測站名稱:" AssociatedControlID="ddlSite" />
      <asp:DropDownList ID="ddlSite" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged"></asp:DropDownList>

      <asp:Label ID="lblItem" runat="server" Text="檢測項目:" AssociatedControlID="ddlItem" />
      <asp:DropDownList ID="ddlItem" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged"></asp:DropDownList>

      <asp:Label ID="lblMonth" runat="server" Text="監測月份:" AssociatedControlID="ddlMonth" />
      <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged"></asp:DropDownList>
    </div>

    <div class="gridview-container">
      <asp:GridView
        ID="gvData"
        runat="server"
        AutoGenerateColumns="false"
        AllowSorting="true"
        OnSorting="gvData_Sorting"
        EmptyDataText="目前無符合條件的資料">
        <Columns>
          <asp:BoundField DataField="sitename"    HeaderText="測站名稱"    SortExpression="sitename" />
          <asp:BoundField DataField="siteid"      HeaderText="測站代碼"    SortExpression="siteid" />
          <asp:BoundField DataField="itemid"      HeaderText="檢測代碼"    SortExpression="itemid" />
          <asp:BoundField DataField="itemname"    HeaderText="檢測項目"    SortExpression="itemname" />
          <asp:BoundField DataField="itemengname" HeaderText="項目英文"    SortExpression="itemengname" />
          <asp:BoundField DataField="itemunit"    HeaderText="單位"        SortExpression="itemunit" />
          <asp:BoundField DataField="monitormonth" HeaderText="監測月份"    SortExpression="monitormonth" />
          <asp:BoundField DataField="concentration"
                          HeaderText="平均濃度"
                          SortExpression="concentration"
                          DataFormatString="{0:N2}" />
        </Columns>
      </asp:GridView>
    </div>
       <!-- 新增：顯示多維度圖表按鈕 -->
    <div style="text-align:center; margin-top:20px;">
      <asp:Button 
        ID="btnShowChart" 
        runat="server" 
        Text="顯示多維度圖表" 
        OnClientClick="openMultiChart(); return false;" />
    </div>
    </div>
</asp:Content>
