using System;
using System.Collections;
using System.Configuration;
using System.Data;
//**********************
using System.Data.SqlClient;
//**********************
using System.Web;
//**********************
using System.Web.Configuration;
//**********************

using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ch09_DataBinding_2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //=======微軟SDK文件的範本=======
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select top 1 id,title,summary,article from test", Conn);
        SqlDataReader dr;

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            Conn.Open();   //---- 這時候才連結DB

            dr = cmd.ExecuteReader();   // 這時候執行SQL指令，取出資料

            //註解：從資料庫裡面，把資料撈出來之後，交給這FormView控制項「呈現」在畫面上～
            FormView1.DataSource = dr;
            FormView1.DataBind();

            // Always call Close when done reading.
            cmd.Cancel();
                //關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
            dr.Close();


            // Close the connection when done with it.
            if (Conn.State == ConnectionState.Open) 
            {
                Conn.Close();
                Conn.Dispose();   //一開始宣告有用到 new的,最後必須以 .Dispose()結束
             }
        }
        catch (Exception ex)   // 如果程式有錯誤或是例外狀況，將執行這一段
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
            throw;
        }

    }
}
