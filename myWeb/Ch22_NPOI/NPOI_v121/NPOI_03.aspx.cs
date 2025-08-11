using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//==========================
using System.IO;
using NPOI.HSSF.UserModel;
using NPOI.HPSF;
using NPOI.POIFS.FileSystem;
//==========================


public partial class Book_Sample_Ch11_NOPI_03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 本範例的資料來源：http://msdn.microsoft.com/zh-tw/ee818993.aspx 

        HSSFWorkbook workbook= new HSSFWorkbook();
        MemoryStream ms= new MemoryStream();  //==需要 System.IO命名空間

        //== 新增試算表 Sheet名稱。
        HSSFSheet u_sheet = workbook.CreateSheet("My Sheet");

        //== 建立儲存格樣式（底色）。
        HSSFCellStyle style1 = workbook.CreateCellStyle();
        style1.FillForegroundColor = NPOI.HSSF.Util.HSSFColor.BLUE.index2;  //==藍色底的儲存格
        style1.FillPattern = HSSFCellStyle.SOLID_FOREGROUND;

        HSSFCellStyle style2 = workbook.CreateCellStyle();
        style2.FillForegroundColor = NPOI.HSSF.Util.HSSFColor.YELLOW.index2;  //==黃色底的儲存格
        style2.FillPattern = HSSFCellStyle.SOLID_FOREGROUND;


        //== 設定儲存格樣式與資料。
        HSSFCell cell = u_sheet.CreateRow(0).CreateCell(0);
        cell.CellStyle = style1;
        cell.SetCellValue("0000");  //== 插入資料值。

        cell = u_sheet.CreateRow(1).CreateCell(0);
        cell.CellStyle = style2;
        cell.SetCellValue("1111");  //== 插入資料值。

        cell = u_sheet.CreateRow(2).CreateCell(0);
        cell.CellStyle = style1;
        cell.SetCellValue("2222");  //== 插入資料值。

        cell = u_sheet.CreateRow(3).CreateCell(0);
        cell.CellStyle = style2;
        cell.SetCellValue("3333");  //== 插入資料值。

        cell = u_sheet.CreateRow(4).CreateCell(0);
        cell.CellStyle = style1;
        cell.SetCellValue("4444");  //== 插入資料值。


        workbook.Write(ms);

        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", String.Format("attachment; filename=EmptyWorkbook_3.xls"));
        Response.BinaryWrite(ms.ToArray());

        //== 釋放資源
        workbook = null;   //== C#為 null
        ms.Close();
        ms.Dispose();
    }
}