using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//-- 自己寫的（宣告）--
using System.IO;    //-- FileStream會用到這個命名空間
using NPOI.HSSF.UserModel;
//===============================
using NPOI.SS.UserModel;    //-- v.1.2.4新增的。
//===============================


public partial class Book_Sample_Ch11_NPOI_01_new_v124 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 本範例的資料來源：http://tonyqus.sinaapp.com/archives/58

        IWorkbook workbook  = new HSSFWorkbook();  //-- v.1.2.4版的新寫法！
        //===============================================

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
        Response.AddHeader("Content-Disposition","attachment; filename=EmptyWorkbook_1.xls");
        Response.BinaryWrite(MS.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        MS.Close();
        MS.Dispose();
    }
}