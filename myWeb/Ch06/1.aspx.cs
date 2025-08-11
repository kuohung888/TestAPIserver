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


public partial class Ch06_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();   //第一、連結資料庫

        SqlCommand cmd = new SqlCommand("select Top 10 id,test_time,title from test", Conn);
        SqlDataReader dr = cmd.ExecuteReader();   //第二、執行SQL指令，取出資料

        //第三，自由發揮
        while (dr.Read())
        {
            Response.Write("文章編號：" + dr["id"].ToString() + "<br>");
            Response.Write("日    期：" + dr["test_time"].ToString() + "<br>");
            Response.Write("文章標題：" + dr["title"].ToString());
            Response.Write("<hr>");
        }
        cmd.Cancel();
        dr.Close();
        Conn.Close();   //第四、關閉資料庫的連接與相關資源

    }
}
