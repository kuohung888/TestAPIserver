using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的 ==================
using System.IO;
using NPOI.HSSF.UserModel;
using NPOI.HPSF;
using NPOI.POIFS.FileSystem;
//===========================

public partial class Book_Sample_Ch11_NOPI_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 本範例的資料來源：http://msdn.microsoft.com/zh-tw/ee818993.aspx 

        HSSFWorkbook workbook = new HSSFWorkbook();
        MemoryStream ms = new MemoryStream();  //==需要 System.IO命名空間

        //== 新增試算表 Sheet名稱。
        HSSFSheet u_sheet= workbook.CreateSheet("My Sheet");

        //== 插入資料值。
        u_sheet.CreateRow(0).CreateCell(0).SetCellValue("0000");
        u_sheet.CreateRow(1).CreateCell(0).SetCellValue("1111");
        u_sheet.CreateRow(2).CreateCell(0).SetCellValue("2222");
        u_sheet.CreateRow(3).CreateCell(0).SetCellValue("3333");
        u_sheet.CreateRow(4).CreateCell(0).SetCellValue("4444");
        u_sheet.CreateRow(5).CreateCell(0).SetCellValue("5555");

        u_sheet.CreateRow(6).CreateCell(1).SetCellValue("6666");  //== CreateCell() 可設定為同一列(Row)的 [第幾個格子]
        u_sheet.CreateRow(6).CreateCell(2).SetCellValue("7777");
        u_sheet.CreateRow(6).CreateCell(3).SetCellValue("8888");


        workbook.Write(ms);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", String.Format("attachment; filename=EmptyWorkbook_2.xls"));
        Response.BinaryWrite(ms.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        ms.Close();
        ms.Dispose();
    }
}