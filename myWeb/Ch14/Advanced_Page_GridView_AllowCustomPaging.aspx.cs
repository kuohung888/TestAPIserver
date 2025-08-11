using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----
public partial class Book_Sample_Ch10_GridView_AllowCustomPageing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.VirtualItemCount = MIS2000Lab_GetPageCount();  // 取得總記錄的數量。

            GridView1.DataSource = MIS2000Lab_GetPageData(0, 10);
            GridView1.DataBind();
        }
    }
    

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        GridView1.DataSource = MIS2000Lab_GetPageData(e.NewPageIndex, 10);
        GridView1.DataBind();
    }


    // ***** 分頁。使用SQL指令進行分頁 *****
    protected DataTable MIS2000Lab_GetPageData(int currentPage, int myPageSize)
    {
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;

        String SqlStr = "Select test_time, id, title, summary from test Order By id ";
        SqlStr += " OFFSET " + (currentPage * GridView1.PageSize) + " ROWS FETCH NEXT " + (myPageSize) + " ROWS ONLY";
        //==SQL 2012 指令的 Offset...Fetch。參考資料： http://sharedderrick.blogspot.tw/2012/06/t-sql-offset-fetch.html  
        
        SqlCommand cmd = new SqlCommand(SqlStr, Conn);
        DataTable DT = new DataTable();

        try
        {
            //== 第一，連結資料庫。
            Conn.Open();
            //== 第二，執行SQL指令。
            dr = cmd.ExecuteReader();

            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            //==自己寫迴圈==
            DT.Load(dr);    // 將DataReader的成果 "載入" DataTable裡面。
        }
        //catch (Exception ex)
        //{   //---- 如果程式有錯誤或是例外狀況，將執行這一段
        //    //Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        //}
        finally
        {
            // == 第四，釋放資源、關閉資料庫的連結。
            if (dr != null)
            {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                dr.Close();
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

        return DT;
    }


    // ***** 取得總記錄的數量。*****
    protected int MIS2000Lab_GetPageCount()
    {
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(id) from test", Conn);
        int myPageCount = 0;
        try
        {
            //== 第一，連結資料庫。
            Conn.Open();

            //== 第二，執行SQL指令。
            myPageCount = (int)cmd.ExecuteScalar();

            //==第三，自由發揮，把執行後的結果呈現到畫面上。

        }
        //catch (Exception ex)
        //{   //---- 如果程式有錯誤或是例外狀況，將執行這一段
        //    //Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        //}
        finally
        {
            // == 第四，釋放資源、關閉資料庫的連結。
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

        return myPageCount;
    }

}