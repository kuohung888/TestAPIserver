using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的----

public partial class Ch14_Default_1_1_DataReader_StoredProcedure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //----上面已經事先寫好NameSpace --  Using System.Web.Configuration; ----     
        //----或是寫成下面這一行 (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        SqlDataReader dr = null;

        SqlCommand cmd;
        cmd = new SqlCommand("test_homepage", Conn);

        //----註解：下面這是重點！！！ ----
        cmd.CommandType = CommandType.StoredProcedure;


        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            Conn.Open();   //---- 這時候才連結DB
            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

            GridView1.DataSource = dr;
            GridView1.DataBind();    //--資料繫結
        }
        catch (Exception ex)
        {  //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
            throw;
        }
        finally
        {   //---- Always call Close when done reading.
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
            GridView1.Dispose();
        }

    }
}
