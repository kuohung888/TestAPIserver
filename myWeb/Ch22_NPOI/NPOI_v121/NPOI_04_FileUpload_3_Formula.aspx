<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_04_FileUpload_3_Formula.aspx.cs" Inherits="Book_Sample_Ch11_NPOI_04_FileUpload_3_Formula" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>將手上的 Test_Data.xls 資料檔，讀取到 DataTable，再輸出到網頁上的 GridView</title>
</head>
<body>
    <form id="form1" runat="server">
            <div>
            請先選取 
                Excel檔案(Ex: NPOI_Test_Sample_Formula.xls)，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
               </asp:FileUpload>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" 
                Text="將手上的 Test_Data.xls 資料檔，上傳檔案！讀取到 DataTable，再輸出到網頁上的 GridView" 
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
