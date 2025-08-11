using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

//== for Excel file Export ==
using System.IO;
using NPOI.HSSF.UserModel;
using NPOI.HPSF;
using NPOI.POIFS.FileSystem;
//----自己寫的----


public partial class Book_Sample_Ch11_NOPI_02_DB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //***************************************************************************
        //*** for Exporting to a Excel file
        HSSFWorkbook workbook= new HSSFWorkbook();
        MemoryStream ms= new MemoryStream();  //==需要 System.IO命名空間

        //== 新增試算表 Sheet名稱。
        HSSFSheet u_sheet = workbook.CreateSheet("My Sheet");
        //***************************************************************************

        //=======微軟SDK文件的範本=======
         SqlConnection Conn  = new SqlConnection();
        //----上面已經事先寫好 Imports System.Web.Configuration ----
        Conn.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        //----(連結資料庫)----

        SqlDataReader dr = null;

        SqlCommand cmd= new SqlCommand("select id,test_time,summary,author from test", Conn);

        try
        {
            Conn.Open();   //---- 這時候才連結DB

            dr = cmd.ExecuteReader();  //---- 這時候執行SQL指令，取出資料

            //===============================================
            //== 利用迴圈，把資料寫入 Excel各個儲存格裡面。
            int k = 0;

            while (dr.Read())
            {
                for (int i = 0; i < dr.FieldCount; i++)
                {
                    //-- FieldCount是指 DataReader每一列紀錄裡面，有幾個欄位。
                    u_sheet.CreateRow(k).CreateCell(i).SetCellValue(dr.GetValue(i).ToString());  //*** for Exporting to a Excel file
                }
                k++;
            }
            //===============================================
        }
        catch(Exception ex)   //---- 如果程式有錯誤或是例外狀況，將執行這一段
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
        }
        finally
        {
            if (dr != null) 
            {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
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
        workbook.Write(ms);

        //== Excel檔名，請寫在最後面 filename的地方
        Response.AddHeader("Content-Disposition", String.Format("attachment; filename=EmptyWorkbook_2_DB.xls"));
        Response.BinaryWrite(ms.ToArray());

        //== 釋放資源
        workbook = null;   //== C#為 null
        ms.Close();
        ms.Dispose();
    }
}