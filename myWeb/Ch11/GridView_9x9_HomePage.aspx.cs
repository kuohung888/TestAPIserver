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


public partial class Book_Sample_Ch11_GridView_9x9_HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (e.Row.RowIndex == 0)
            {
                Session["RecordNo"] = e.Row.RowIndex;
            }

            int RecordNo = Convert.ToInt32(Session["RecordNo"]);
            int StartNo = RecordNo + 1;
            int EndNo = RecordNo + 3;

            //=======微軟SDK文件的範本=======
            //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
            //----或是寫成下面這一行 (連結資料庫)----
            SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand("Select id, title, author from (select ROW_NUMBER() OVER(ORDER BY id) AS 'RowNo', * from test) as t where t.RowNo between " + StartNo + " and " + EndNo, Conn);
            //*** 使用SQL指令進行分頁（ROW_NUMBER()）***
            //*** 每次（每頁）抓出九筆記錄即可。***

            try
            {
                //== 第一，連結資料庫。
                Conn.Open();
                //== 第二，執行SQL指令。
                dr = cmd.ExecuteReader();

                //==第三，自由發揮，把執行後的結果呈現到畫面上。
                int i = 1;
                while (dr.Read())
                {   //使用流水號當作 Label的ID，書本上集介紹過兩次。
                    Label Ax = (Label)e.Row.FindControl("LabelA" + i);   
                    //**重點！寫成 e.Row才正確！寫成 GridView1.Rows[]會錯誤！
                    Ax.Text = dr["id"].ToString() + "<br>";

                    Label Bx = (Label)e.Row.FindControl("LabelB" + i);
                    Bx.Text = dr["title"].ToString() + "<br>";
                    
                    Label Cx = (Label)e.Row.FindControl("LabelC" + i);
                    Cx.Text = dr["author"].ToString();

                    Session["RecordNo"] = Convert.ToInt32(Session["RecordNo"]) + 1;
                    i++;
                }
            }
            catch (Exception ex)
            {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
                Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
            }
            finally
            {   // == 第四，釋放資源、關閉資料庫的連結。
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
        }  //--if (e.Row.RowType == DataControlRowType.DataRow)
    }



    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //***放在這個事件也能正常運作。***
    }
}