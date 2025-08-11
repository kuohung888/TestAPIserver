<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_20_04_FileUpload.aspx.cs" Inherits="Book_Sample_Ch11_NOPI_04_FileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>將手上的 Excel資料檔，讀取到 DataTable，再輸出到網頁上的 GridView</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div>
            請先選取 
                Excel檔案(Ex: NPOI_Test_Sample_2010.xlsx)，然後再上傳：
               <asp:FileUpload id="FileUpload1" runat="server">
               </asp:FileUpload>
                <br />
                <span class="style1"><strong>只支援 .xlsx檔的格式（Excel 2007起的新版本）</strong></span></div>
            <br />
            <asp:Button ID="Button1" runat="server" 
                Text="將手上的 NPOI_test_sample_2010.xlsx （新版Excel）上傳檔案！讀取到 DataTable，再輸出到網頁上的 GridView" 
                onclick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
    </form>
</body>
</html>
