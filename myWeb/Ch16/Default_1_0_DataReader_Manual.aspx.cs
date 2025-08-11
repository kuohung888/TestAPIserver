using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的----
//using System.Web.Configuration;  //在本範例用不到
using System.Data.SqlClient;
//----自己寫的----

public partial class Ch14_Default_1_0_DataReader_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //=======微軟SDK文件的範本=======
       
        //----上面已經事先寫好NameSpace --  Using System.Web.Configuration; ----     
        //----(連結資料庫)----傳統作法 (in the Web.Config file)
        //SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        //===================================================
        //== 連線字串寫在 Global.asax裡面 Application
        SqlConnection Conn = new SqlConnection(Application["App_DBConnString"].ToString());
        //===================================================

        SqlDataReader dr = null;

        SqlCommand cmd;
        cmd = new SqlCommand("select id,test_time,summary,author from test", Conn);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            Conn.Open();   //---- 第一步驟。連結DB
            dr = cmd.ExecuteReader();   //---- 第二步驟。執行SQL指令，取出資料

            //第三步驟。
            GridView1.DataSource = dr;
            GridView1.DataBind();    //--資料繫結
        }
        catch (Exception ex)
        {  //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
            //throw; 
        }
        finally
        {   //第四步驟。
            //---- Always call Close when done reading.
            if (dr != null)
            {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                dr.Close();
             }

            //---- Close the connection when done with it.
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }

        }
    
    }
}
