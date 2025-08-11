using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的（宣告）----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
//----自己寫的（宣告）----



public partial class Book_Sample_Ch14_Default_2_2_DataSet_GridView : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //=======微軟SDK文件的範本=======
        //----上面已經事先寫好 Imports System.Web.Configuration ----
        //----(1). 連結資料庫----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        //----(2). 執行SQL指令（Select陳述句）----
        SqlDataAdapter myAdapter = new SqlDataAdapter("select id,test_time,title,author from test", Conn);

        DataSet ds = new DataSet();

        try
        {  //==== 以下程式，只放「執行期間」的指令！=================
            // ---- 不用寫Conn.Open(); ，DataAdapter會自動開啟
            myAdapter.Fill(ds, "test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。

            //----(3). 自由發揮。由 GridView來呈現資料。----
            GridView1.DataSource = ds;
            //----標準寫法 GridView1.DataSource = ds.Tables["test"].DefaultView; ----
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            //---- http://www.dotblogs.com.tw/billchung/archive/2009/03/31/7779.aspxs
            Response.Write("<hr /> Exception Error Message----  " + ex.ToString());
        }
        finally
        {
            //----(4). 釋放資源、關閉連結資料庫----
            //---- 不用寫，DataAdapter會自動關閉
            //if (Conn.State == ConnectionState.Open)  {
            //  Conn.Close();
            //  Conn.Dispose();
            // }
        }
    }
}