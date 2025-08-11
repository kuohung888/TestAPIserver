<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_04_FileUpload_2.aspx.cs" Inherits="Book_Sample_Ch11_NOPI_04_FileUpload_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>將手上的NPOI_ Test_Sample.xls 資料檔，讀取到 DataTable，再輸出到網頁上的 GridView</title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #99FF33;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div>
                <span class="style1">第二種FileUpload寫法</span> ,
                <br />
            請先選取 
                Excel檔案(Ex: Test_Data.xls)，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
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
            <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" 
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
                GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                    HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
    </form>
</body>
</html>
