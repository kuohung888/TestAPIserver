using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的（宣告） ----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

//== for Excel file Export ==
//== 自己寫的（宣告） ==================
using System.IO;
using NPOI.HSSF.UserModel;
//using NPOI.HPSF;                    //-- v.1.2.4版可以取消這個命名空間。
//using NPOI.POIFS.FileSystem;    //-- v.1.2.4版可以取消這個命名空間。
//===============================
using NPOI.SS.UserModel;    //-- v.1.2.4新增的。
//===============================


public partial class Book_Sample_Ch11_NPOI_02_DB_new_v124 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //***************************************************************************
        //*** for Exporting to a Excel file
        HSSFWorkbook workbook = new HSSFWorkbook();


        //== 新增試算表 Sheet名稱。使用 NPOI.SS.UserModel命名空間。(v.1.2.4版）
        ISheet u_sheet = (ISheet)workbook.CreateSheet("My Sheet_124");
        //***************************************************************************

        //=======微軟SDK文件的範本=======
        SqlConnection Conn = new SqlConnection();
        //----上面已經事先寫好 Imports System.Web.Configuration ----
        Conn.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        //----(連結資料庫)----

        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select id, test_time, summary, author from test", Conn);

        try
        {
            Conn.Open();   //---- 這時候才連結DB
            dr = cmd.ExecuteReader();  //---- 這時候執行SQL指令，取出資料

            //===============================================(start)
            //== 利用迴圈，把資料寫入 Excel各個儲存格裡面。
            int k = 0;

            while (dr.Read())
            {
                //**** v.1.2.4版在此有很大的改變！！！請看 http://tonyqus.sinaapp.com/archives/73 
                //**** 先建好一列（Row），才能去作格子（Cell）
                IRow u_Row= u_sheet.CreateRow(k);

                for (int i = 0; i < dr.FieldCount; i++)
                {   //-- FieldCount是指 DataReader每一列紀錄裡面，有幾個欄位。

                    //**********************************************************(start)
                    //**** v.1.2.4版在此有很大的改變！！！請看 http://tonyqus.sinaapp.com/archives/73  
                    u_Row.CreateCell(i).SetCellValue(dr.GetValue(i).ToString());  //== .CreateCell() 可設定為同一列(Row)的 [第幾個格子]
                    //**********************************************************(end)

                    //u_Row.CreateCell(i).SetCellType(CellType.STRING);
                    //設定每一個欄位（格子）的儲存格內容，如：字串。

                    //XXXXX 以下用法，在 v1.2.4版會有 Bug，只能列出每一列的「最後一格」的資料！！XXXXXXXXXX
                    //== 避免這樣的錯誤，請看 http://tonyqus.sinaapp.com/archives/73
                    //    u_sheet.CreateRow(k).CreateCell(i).SetCellValue(dr.GetValue(i).ToString());  //*** for Exporting to a Excel file (v.1.2.1版，正常)
                }
                k++;
            }
            //===============================================(end)
        }
        catch (Exception ex)   //---- 如果程式有錯誤或是例外狀況，將執行這一段
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally
        {
            if (dr != null)
            {
                cmd.Cancel();  //----關閉DataReader之前，一定要先「取消」SqlCommand
                dr.Close();
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose();  //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

        //***************************************************************************
        //*** for Exporting to a Excel file
        MemoryStream ms = new MemoryStream();  //==需要 System.IO命名空間
        workbook.Write(ms);

        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", "attachment; filename=EmptyWorkbook_2_DB.xls");
        Response.BinaryWrite(ms.ToArray());

        //== 釋放資源
        workbook = null;   //== C#為 null
        ms.Close();
        ms.Dispose();
    }
}