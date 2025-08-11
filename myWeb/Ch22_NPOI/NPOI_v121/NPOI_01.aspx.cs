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

public partial class Book_Sample_Ch11_NPOI_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 本範例的資料來源：http://msdn.microsoft.com/zh-tw/ee818993.aspx 

        HSSFWorkbook workbook = new HSSFWorkbook();
        MemoryStream ms = new MemoryStream();  //==需要 System.IO命名空間

        //== 新增試算表。
        //== 生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表 Sheet
        workbook.CreateSheet("試算表 Sheet A");
        workbook.CreateSheet("試算表 Sheet B");
        workbook.CreateSheet("試算表 Sheet C");

        workbook.Write(ms);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", String.Format("attachment; filename=EmptyWorkbook_1.xls"));
        Response.BinaryWrite(ms.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        ms.Close();
        ms.Dispose();
    }
}