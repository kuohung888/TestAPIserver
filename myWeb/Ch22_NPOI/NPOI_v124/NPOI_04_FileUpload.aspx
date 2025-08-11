<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_04_FileUpload.aspx.cs" Inherits="Book_Sample_Ch11_NOPI_04_FileUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>將手上的 Test_Data.xls 資料檔，讀取到 DataTable，再輸出到網頁上的 GridView</title>
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
                Excel檔案(Ex: NPOI_Test_Sample.xls)，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
               </asp:FileUpload>
                <br />
                <span class="style1"><strong>只支援 .xls檔的格式（OLE2 / Excel 2003）</strong></span></div>
            <br />
            <asp:Button ID="Button1" runat="server" 
                Text="將手上的 Test_Data.xls 資料檔，上傳檔案！讀取到 DataTable，再輸出到網頁上的 GridView" 
                onclick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
    </form>
</body>
</html>
