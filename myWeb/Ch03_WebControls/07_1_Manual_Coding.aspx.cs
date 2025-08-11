using System;
using System.Collections;
using System.Configuration;
using System.Data;
//**********************(自己動手加上的)
using System.Data.SqlClient;
//**********************
using System.Linq;
using System.Web;
//**********************(自己動手加上的)
using System.Web.Configuration;
//**********************
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch03_WebControls_7_1_Manual_Coding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //註解：SqlDataSource的設定畫面，幫我們處理掉下面這一大串程式碼。
        //    本程式的執行結果，跟上面 7_1.aspx完全相同！

        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();   //第一、連結資料庫

        SqlCommand cmd  = new SqlCommand("select id,title from test", Conn);
        SqlDataReader dr  = cmd.ExecuteReader();   //第二、執行SQL指令，取出資料

        //註解：執行SQL指令之後，把資料庫撈出來的結果，
        //    交由ListBox控制項來呈現。
            ListBox1.DataSource = dr;
            ListBox1.DataBind();   //第三、資料繫結

        //註解：注意！！這裡的 .DataSource與另外一個「DataSourceID」屬性
        //    完全不同。兩者也不可同時使用！本書後續會深入解說……

         cmd.Cancel();
         dr.Close();
         Conn.Close();   //第四、關閉資料庫的連接與相關資源
    }
}
