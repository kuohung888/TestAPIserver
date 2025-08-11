using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ==================
using System.IO;
using NPOI.XSSF.UserModel;
//===============================
using NPOI.SS.UserModel;    //-- v.1.2.4新增的。
//===============================


public partial class Book_Sample_Ch11_NOPI_03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        XSSFWorkbook workbook= new XSSFWorkbook();

        //== 新增試算表 Sheet名稱。
        ////方法一：
        ISheet u_sheet = (ISheet)workbook.CreateSheet("My Sheet_2131方法一");
        ////方法二：
        //XSSFSheet u_sheet = (XSSFSheet)workbook.CreateSheet("My Sheet_v2131方法二");


        //== 建立儲存格樣式（底色）。 =============================(start)
        //== 先設定好，兩種Style
        XSSFCellStyle style1 = (XSSFCellStyle)workbook.CreateCellStyle();
        style1.FillForegroundColor = NPOI.HSSF.Util.HSSFColor.Blue.Index2;  //==藍色底的儲存格
        style1.FillPattern = FillPattern.SolidForeground;  //==底圖（紋路）

        XSSFCellStyle style2 = (XSSFCellStyle)workbook.CreateCellStyle();
        style2.FillForegroundColor = NPOI.HSSF.Util.HSSFColor.Yellow.Index2;  //==黃色底的儲存格
        style2.FillPattern = FillPattern.Squares;  //==底圖（紋路）
        //======================================================(end)


        //== 設定儲存格樣式與資料。
        //== 這裡在 v.1.2.4版 有很大的改變，請參閱之前的 (NPOI範例 02)
        //== 只有「每一列」的第一個格子，才能用 .CreateRow()方法！
        XSSFCell cell = (XSSFCell)u_sheet.CreateRow(0).CreateCell(0);
        cell.CellStyle = style1;
        cell.SetCellValue("0000");  //== 插入資料值。

        cell = (XSSFCell)u_sheet.CreateRow(1).CreateCell(0);
        cell.CellStyle = style2;
        cell.SetCellValue("1111");  //== 插入資料值。

        cell = (XSSFCell)u_sheet.CreateRow(2).CreateCell(0);
        cell.CellStyle = style1;
        cell.SetCellValue("2222");  //== 插入資料值。

        cell = (XSSFCell)u_sheet.CreateRow(3).CreateCell(0);
        cell.CellStyle = style2;
        cell.SetCellValue("3333");  //== 插入資料值。

        cell = (XSSFCell)u_sheet.CreateRow(4).CreateCell(0);
        cell.CellStyle = style1;
        cell.SetCellValue("4444");  //== 插入資料值。


        //== 輸出Excel 2007檔案。==============================
        MemoryStream MS = new MemoryStream();   //==需要 System.IO命名空間
        workbook.Write(MS);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", "attachment; filename=EmptyWorkbook_2007_BackColor.xlsx");
        Response.BinaryWrite(MS.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        MS.Close();
        MS.Dispose();

        Response.Flush();    //== 不寫這兩段程式，輸出Excel檔並開啟以後，會出現檔案內容混損，需要修復的字眼。
        Response.End();
    }

}