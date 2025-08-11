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
using NPOI.HSSF.UserModel;   //-- HSSF 用來產生Excel 2003檔案（.xls）
using NPOI.XSSF.UserModel;   //-- XSSF 用來產生Excel 2007檔案（.xlsx）

using NPOI.SS.UserModel;    //-- v.1.2.4起 新增的。
//===============================


public partial class NPOI_20_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {   
        //**** v1.2.4版 **************************************************

        IWorkbook workbook = new HSSFWorkbook();  //-- v.1.2.4版的寫法！
        // HSSF是用來產生 Excel 2003格式的。

        //== 新增試算表。
        //== 生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表 Sheet
        workbook.CreateSheet("試算表 Sheet A_124");
        workbook.CreateSheet("試算表 Sheet B_124");
        workbook.CreateSheet("試算表 Sheet C_124");

        //== Excel檔名，請寫在最後面 filename的地方。
        //========================================= 方法一。(start)
        //FileStream myFile = new FileStream("D:\EmptyWorkbook_1.xls", FileMode.Create);
        //workbook.Write(myFile);    //-- 直接寫到 Web Server的硬碟（D:\）裡面。
        ////== 釋放資源
        //myFile.Close();


        //========================================= 方法二。(start)
        MemoryStream MS = new MemoryStream();  //==需要 System.IO命名空間
        workbook.Write(MS);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", "attachment; filename=EmptyWorkbook_2003_1.xls");
        Response.BinaryWrite(MS.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        MS.Close();
        MS.Dispose();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //命名空間。using NPOI.XSSF.UserModel;   
        IWorkbook workbook = new XSSFWorkbook();   //-- XSSF 用來產生Excel 2007檔案（.xlsx）


        //== 新增試算表。===================================
        //== 生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表 Sheet

        //沿用 1.2.4的寫法可以產生Excel檔案，但開啟檔案時，會出現一些錯誤
        //workbook.CreateSheet("試算表 Sheet A_20");
        //workbook.CreateSheet("試算表 Sheet B_20");
        //workbook.CreateSheet("試算表 Sheet C_20");

        //-- XSSF 用來產生Excel 2007檔案（.xlsx）
        XSSFSheet worksheet = (XSSFSheet)workbook.CreateSheet("試算表 Sheet A_20");


        //== 輸出Excel 2007檔案。==============================
        MemoryStream MS = new MemoryStream();   //==需要 System.IO命名空間
        workbook.Write(MS);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", "attachment; filename=EmptyWorkbook_2007_1.xlsx");
        Response.BinaryWrite(MS.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        MS.Close();
        MS.Dispose();


        //===================================================
        //== 原廠NPOI範例的寫法，請參考	 /xssf/DownloadXlsx目錄
        //==  或是	 /xssf/CreateEmptyWorkbook目錄（這是Windows程式）
        //===================================================
        //string filename = "test.xlsx";

        //Response.Clear();
        //Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));

        //XSSFWorkbook workbook = new XSSFWorkbook();
        //ISheet sheet1 = workbook.CreateSheet("Sheet1");

        //sheet1.CreateRow(0).CreateCell(0).SetCellValue("This is a Sample");
        //int x = 1;
        //for (int i = 1; i <= 15; i++)
        //{
        //    IRow row = sheet1.CreateRow(i);
        //    for (int j = 0; j < 15; j++)
        //    {
        //        row.CreateCell(j).SetCellValue(x++);
        //    }
        //}
        //using (var f = File.Create(@"c:\test.xlsx"))
        //{
        //    workbook.Write(f);
        //}
        //Response.WriteFile(@"c:\test.xlsx");
        ////http://social.msdn.microsoft.com/Forums/en-US/3a7bdd79-f926-4a5e-bcb0-ef81b6c09dcf/responseoutputstreamwrite-writes-all-but-insetrs-a-char-every-64k?forum=ncl
        ////workbook.Write(Response.OutputStream); cannot be used 
        ////root cause: Response.OutputStream will insert unnecessary byte into the response bytes.
        //Response.Flush();
        //Response.End();
    }
}