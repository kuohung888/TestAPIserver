using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;    //-- FileStream會用到這個命名空間

//===============================
// NPOI 2.0的命名空間與 .DLL檔案（加入參考） ----
//     HSSF（Excel 2003）, XSSF（Excel 2007）, XWPF（Word 2007）。 
using NPOI.XSSF.UserModel;   //-- XSSF 用來產生Excel 2007檔案（.xlsx）

using NPOI.SS.UserModel;    //-- v.1.2.4起 新增的。
//===============================

public partial class Book_Sample_Ch11_NPOI_v2131_Default_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        XSSFWorkbook workbook = new XSSFWorkbook();

        //== 產生三個工作表（中文名稱），需要搭配 NPOI.SS.UserModel命名空間
        ISheet u_sheet1 = workbook.CreateSheet("NPOI20_工作表_Sheet1");
        ISheet u_sheet2 = workbook.CreateSheet("NPOI20_工作表_Sheet2");
        ISheet u_sheet3 = workbook.CreateSheet("NPOI20_工作表_Sheet3");



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

        Response.Flush();    //== 不寫這兩段程式，輸出Excel檔並開啟以後，會出現檔案內容混損，需要修復的字眼。
        Response.End();
    }
}