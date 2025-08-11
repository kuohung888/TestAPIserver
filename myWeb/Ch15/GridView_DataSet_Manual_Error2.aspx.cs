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



public partial class Book_Sample_Ch15_GridView_DataSet_Manual_Error2 : System.Web.UI.Page
{
    //====自己手寫的程式碼， DataAdapter / DataSet ====(Start)
    protected void DBInit()
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
            Response.Write("<HR/> Exception Error Message----  " + ex.ToString());
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
    //====自己手寫的程式碼， DataAdapter / DataSet ====(End)


    //**********************************************************************
    //*** 改用 PreRender事件以後就OK了！ *****************************************
    protected void Page_PreRender(object sender, EventArgs e)
    {  // *** 測試重點！！ ***
        DBInit();
    }
    /*
    protected void Page_Load(object sender, EventArgs e)
    {  // *** 測試重點！！ ***
        //if (!Page.IsPostBack)  //--網頁第一次執行的時候，才會運作到這一行！
        //{
        DBInit();
        //}
    }
    */


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //== 分 頁 ==
        GridView1.PageIndex = e.NewPageIndex;

        // *** 測試重點！！ ***
        //DBInit();
    }
}