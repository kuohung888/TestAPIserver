using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的----

public partial class Ch14_Default_1_2_DataReader_Manual_Using : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string SQLstr = "SELECT * From test";

        using(SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(SQLstr, Conn);
            Conn.Open();  //==第一，連結資料庫==
            //—註解：開啟資料庫連線！但後面「不」需要寫關閉的動作（Conn.Close()），因為Using....End Using 會自己處理資源的後續動作。

            //==第二，設定SQL指令==
            SqlDataReader dr = cmd.ExecuteReader();

            //==第三，自由發揮，將資料呈現在畫面上==
            //---- 把DataReader獲得的資料，跟GridView控制項繫結（.DataBind()）在一起。
            //---- GridView控制項就會自動把資料展現在畫面上了。
            GridView1.DataSource = dr;
            GridView1.DataBind();

            cmd.Cancel();
            dr.Close();  //-- 關閉DataReader
        }
        //==第四，關閉資源＆資料庫的連線== 
        //—註解：資料庫連線（Conn）會「自動關閉」。因為它是由 Using來開啟，End Using會自動關閉之。
    }
}
