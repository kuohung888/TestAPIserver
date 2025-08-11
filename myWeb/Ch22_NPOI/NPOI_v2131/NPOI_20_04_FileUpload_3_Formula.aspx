<%@ Page Language="C#" AutoEventWireup="true" Debug="true" CodeFile="NPOI_20_04_FileUpload_3_Formula.aspx.cs" Inherits="Book_Sample_Ch11_NPOI_04_FileUpload_3_Formula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>將手上的Excel資料檔，讀取到 DataTable，再輸出到網頁上的 GridView</title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div>
            請先選取 
                Excel檔案(Ex: NPOI_Test_Sample_Formula_2010.xlsx)，然後再上傳：
               <asp:FileUpload id="FileUpload1" runat="server">
               </asp:FileUpload>
                <br />
                <span class="style1"><strong>只支援 .xlsx檔的格式（新版 / Excel 2007）<br />
                </strong></span>
            </div>
            （<span class="style1">Excel檔案裡面，有欄位是「公式」</span>）<br />
            <br />
            <asp:Button ID="Button1" runat="server" 
                Text="將手上的NPOI_test_sample_Fomula_2010.xlsx （新版Excel）上傳檔案！讀取到 DataTable，再輸出到網頁上的 GridView" 
                onclick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="3" ForeColor="Black" 
                GridLines="Vertical" BackColor="White" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
    </form>
</body>
</html>
