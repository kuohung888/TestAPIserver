using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的（宣告）dor ADO.NET  ----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using System.IO;    //-- FileStream會用到這個命名空間
//===============================
// NPOI 2.0的命名空間與 .DLL檔案（加入參考） ----
//     HSSF（Excel 2003）, XSSF（Excel 2007）, XWPF（Word 2007）。 
using NPOI.XSSF.UserModel;   //-- XSSF 用來產生Excel 2007檔案（.xlsx）

using NPOI.SS.UserModel;    //-- v.1.2.4起 新增的。
//===============================

public partial class Default_createFreezePanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //***************************************************************************
        //*** for Exporting to a Excel file（前半段）
        Response.Clear();
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        XSSFWorkbook workbook = new XSSFWorkbook();

        ISheet u_sheet = workbook.CreateSheet("NPOI20_工作表_Sheet1");
        u_sheet.CreateRow(0).CreateCell(0).SetCellValue("中文測試。This is a Sample。中文測試");


        //=======ADO.NET===============================(start)
        SqlConnection Conn = new SqlConnection();
        //----上面已經事先寫好 Imports System.Web.Configuration ----
        Conn.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select top 20 id, test_time ,summary, author from test", Conn);

        try
        {
            Conn.Open();   //---- 這時候才連結DB
            dr = cmd.ExecuteReader();  //---- 這時候執行SQL指令，取出資料

            //===============================================
            //== 利用迴圈，把資料寫入 Excel各個儲存格裡面。
            int k = 0;

            while (dr.Read())
            {
                //**** v.1.2.4版在此有很大的改變！！！請看 http://tonyqus.sinaapp.com/archives/73 
                //**** 先建好一列（Row），才能去作格子（Cell）
                IRow u_Row = u_sheet.CreateRow(k);

                for (int i = 0; i < dr.FieldCount; i++)
                {   //-- FieldCount是指 DataReader每一列紀錄裡面，有幾個欄位。
                    u_Row.CreateCell(i).SetCellValue(dr.GetValue(i).ToString());  //== .CreateCell() 可設定為同一列(Row)的 [第幾個格子]
                    //u_Row.CreateCell(i).SetCellType(CellType.STRING);
                    //設定每一個欄位（格子）的儲存格內容，如：字串。
                }
                k++;
            }

            //*******************************************************************
            //*** 凍結欄位、鎖定欄位 ***
            u_sheet.CreateFreezePane(1, 1);    //-- 注意！並「沒有」從零算起。
            //*******************************************************************


            //===============================================
        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
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
        //=======ADO.NET===============================(end)
        



        //***************************************************************************
        //*** for Exporting to a Excel file（後半段）

        //== 輸出Excel 2007檔案。==============================
        MemoryStream MS = new MemoryStream();   //==需要 System.IO命名空間
        workbook.Write(MS);
        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", "attachment; filename=EmptyWorkbook_2007_createFreezePanel.xlsx");
        Response.BinaryWrite(MS.ToArray());

        //== 釋放資源
        workbook = null;   //== VB為 Nothing
        MS.Close();
        MS.Dispose();

        Response.Flush();    //== 不寫這兩段程式，輸出Excel檔並開啟以後，會出現檔案內容混損，需要修復的字眼。
        Response.End();
    }
}