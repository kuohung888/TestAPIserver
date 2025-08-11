<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1_Repeated_Values_DataBinding_Error.aspx.cs" Inherits="Book_Sample_B06_DataBinding_Repeated_Values_DataBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h3>Repeated-Values DataBinding -- DataReader版</h3>

        請先設定好「清單控制項」的「Text」與「Value」。<br />
        <span class="auto-style1">您可以從錯誤的畫面中學到什麼？</span>......為什麼只有 DataReader會出錯？<br />
        <h3 style="font-style: normal; font-variant: normal; font-weight: bold; font-stretch: normal; font-size: 13pt; line-height: 17.3333339691162px; font-family: Tahoma, Verdana; color: rgb(117, 141, 56); margin: 10px 0px 5px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(170, 170, 170); letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><a id="homepage_ascx_HomePageDays_DaysList_ctl04_DayItem_DayList_ctl00_TitleUrl" class="posttitle" href="http://www.dotblogs.com.tw/mis2000lab/archive/2014/10/29/repeated-values-databinding_datareader_datatable.aspx" style="color: rgb(204, 102, 51); text-decoration: none;" title="Click To View Entry.">第一天 ADO.NET Samples -- DataReader v.s. DataSet與DataTable</a></h3>
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2014/10/29/repeated-values-databinding_datareader_datatable.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2014/10/29/repeated-values-databinding_datareader_datatable.aspx</a> <br />
        <hr />

        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataTextField="title" DataValueField="id">
        </asp:CheckBoxList>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="title" DataValueField="id">
        </asp:DropDownList>
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataTextField="title" DataValueField="id">
        </asp:RadioButtonList>

    </div>
    </form>
</body>
</html>
