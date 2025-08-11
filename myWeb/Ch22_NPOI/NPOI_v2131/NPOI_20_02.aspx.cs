using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//-- 自己寫的（宣告）--
using System.IO;    //-- FileStream會用到這個命名空間

//===============================
// NPOI 2.0的命名空間與 .DLL檔案（加入參考） ----
//     HSSF（Excel 2003）, XSSF（Excel 2007）, XWPF（Word 2007）。 
//using NPOI.HSSF.UserModel;   //-- HSSF 用來產生Excel 2003檔案（.xls）
using NPOI.XSSF.UserModel;   //-- XSSF 用來產生Excel 2007檔案（.xlsx）
using NPOI.SS.UserModel;    //-- v.1.2.4起 新增的。
//===============================


public partial class NPOI_20_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //命名空間。using NPOI.XSSF.UserModel;   
        IWorkbook workbook = new XSSFWorkbook();   //-- XSSF 用來產生Excel 2007檔案（.xlsx）

        //== 新增試算表。===================================
        //== 生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表 Sheet
        //-- XSSF 用來產生Excel 2007檔案（.xlsx）
        // 方法一：
        //XSSFSheet u_sheet = (XSSFSheet)workbook.CreateSheet("My Sheet_20方法一");

        // 方法二：    v.1.2.4版起的寫法
        //== 新增試算表 Sheet名稱。使用 NPOI.SS.UserModel命名空間。
        ISheet u_sheet = (ISheet)workbook.CreateSheet("My Sheet_20方法二");
        //=======================================


        //== 插入資料值。
        //**** CreateRow()方法，只有這一列的「第一格子」可以這樣用。(v.1.2.4版 的新變化)
        u_sheet.CreateRow(0).CreateCell(0).SetCellValue("000A");
        u_sheet.CreateRow(1).CreateCell(0).SetCellValue("111B");
        u_sheet.CreateRow(2).CreateCell(0).SetCellValue("222C");
        u_sheet.CreateRow(3).CreateCell(0).SetCellValue("333D");
        u_sheet.CreateRow(4).CreateCell(0).SetCellValue("444E");
        u_sheet.CreateRow(5).CreateCell(0).SetCellValue("555F");

        //**********************************************************(start)
        //**** v.1.2.4版在此有很大的改變！！！請看 http://tonyqus.sinaapp.com/archives/73  
        IRow u_Row = u_sheet.CreateRow(6);    //== 先用 IRow介面，建立全新的一列。

        u_Row.CreateCell(1).SetCellValue("6666GG");   //== .CreateCell() 可設定為同一列(Row)的 [第幾個格子]
        u_Row.CreateCell(2).SetCellValue("7777HH");
        u_Row.CreateCell(3).SetCellValue("8888II");
        //**********************************************************(end)



        //== 輸出Excel 2007檔案。==============================
        MemoryStream MS = new MemoryStream();   //==需要 System.IO命名空間
        workbook.Write(MS);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", "attachment; filename=EmptyWorkbook_2007_2.xlsx");
        Response.BinaryWrite(MS.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        MS.Close();
        MS.Dispose();
    }
}