<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_20_05_FileUpload_Add.aspx.cs" Inherits="Book_Sample_Ch11_NPOI_05_FileUpload_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>將手上的 Excel資料檔，上傳後，加入新的資料在匯出另一個Excel檔案</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .auto-style1 {
            background-color: #99CCFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        請先選取 
                Excel檔案(Ex: NPOI_Test_Sample_2010.xlsx)，然後再上傳：<asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
        <br />
        <span class="style1"><strong>只支援 .xlsx檔的格式（新版 / Excel 2007）</strong></span>
    </div>
    <br />
    <asp:Button ID="Button1" runat="server"
        Text="將手上的 NPOI_test_sample_2010.xlsx （新版Excel），上傳檔案！讀取到 DataTable，再輸出到網頁上的 GridView"
        OnClick="Button1_Click" />
    <br />
    <br />
    完成上傳之後，可以<strong><span class="auto-style1">增添新的資料到 Excel檔裡面，再讓您下載！</span></strong><br />
    <br /><br /><br /><br />


    <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
    <br /><br />

    <asp:GridView ID="GridView1" runat="server" CellPadding="3"
        GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    </form>
</body>
</html>

