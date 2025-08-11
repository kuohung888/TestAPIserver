using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ==================
using System.IO;
using NPOI.HSSF.UserModel;
//using NPOI.HPSF;                    //-- v.1.2.4版可以取消這個命名空間。
//using NPOI.POIFS.FileSystem;    //-- v.1.2.4版可以取消這個命名空間。
//===============================
using NPOI.SS.UserModel;    //-- v.1.2.4新增的。
//===============================


public partial class Book_Sample_Ch11_NOPI_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 本範例的資料來源：http://msdn.microsoft.com/zh-tw/ee818993.aspx 
        //== http://tonyqus.sinaapp.com/archives/73  (v.1.2.4版）

        HSSFWorkbook workbook = new HSSFWorkbook();

        //== 新增試算表 Sheet名稱。（v.1.2.1版，沒有變動）
        HSSFSheet u_sheet = (HSSFSheet)workbook.CreateSheet("My Sheet_121");
        //=======================================(v.1.2.4版）
        //== 新增試算表 Sheet名稱。使用 NPOI.SS.UserModel命名空間。
        //ISheet u_sheet = (ISheet)workbook.CreateSheet("My Sheet_124");
        //=======================================


        //== 插入資料值。
        //**** CreateRow()方法，只有這一列的「第一格子」可以這樣用。(v.1.2.4版 的新變化)
        u_sheet.CreateRow(0).CreateCell(0).SetCellValue("0000");
        u_sheet.CreateRow(1).CreateCell(0).SetCellValue("1111");
        u_sheet.CreateRow(2).CreateCell(0).SetCellValue("2222");
        u_sheet.CreateRow(3).CreateCell(0).SetCellValue("3333");
        u_sheet.CreateRow(4).CreateCell(0).SetCellValue("4444");
        u_sheet.CreateRow(5).CreateCell(0).SetCellValue("5555");

        //XXXXX 以下用法，在 v1.2.4版會有 Bug，只能列出每一列的「最後一格（即8888）」的資料！！XXXXXXXXXX
        //== 避免這樣的錯誤，請看 http://tonyqus.sinaapp.com/archives/73    
        //== 以下在  (v.1.2.1版，正常)
        //u_sheet.CreateRow(6).CreateCell(1).SetCellValue("6666");  //== .CreateCell() 可設定為同一列(Row)的 [第幾個格子]
        //u_sheet.CreateRow(6).CreateCell(2).SetCellValue("7777");
        //u_sheet.CreateRow(6).CreateCell(3).SetCellValue("8888");

        //== 如果要「讀取」某個格子，請用 .GetCell(index)方法
        
        //u_sheet.CreateRow(6).CreateCell(1).SetCellValue("6666");  //== .CreateCell() 可設定為同一列(Row)的 [第幾個格子]
        //u_sheet.CreateRow(6).CreateCell(2).SetCellValue("7777");
        //u_sheet.CreateRow(6).CreateCell(3).SetCellValue("8888");

        //**********************************************************
        //**** v.1.2.4版在此有很大的改變！！！請看 http://tonyqus.sinaapp.com/archives/73    
        u_sheet.CreateRow(6).CreateCell(1).SetCellValue("6666");   //== .CreateCell() 可設定為同一列(Row)的 [第幾個格子]

        //**************** 以下 不可再用 .CreateRow()方法，只有這一列的「第一格子」可以這樣用。
        //**************** 後續的（同一列）格子必須改用 .GetRow()方法。很奇怪吧～
        u_sheet.GetRow(6).CreateCell(2).SetCellValue("7777");
        u_sheet.GetRow(6).CreateCell(3).SetCellValue("8888");
        //**************


        MemoryStream ms = new MemoryStream();  //==需要 System.IO命名空間
        workbook.Write(ms);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", "attachment; filename=EmptyWorkbook_2_1.xls");
        Response.BinaryWrite(ms.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        ms.Close();
        ms.Dispose();
    }
}