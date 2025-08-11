using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的----

public partial class Book_Sample_Ch16_Session_Login_DB_HasRow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //----上面已經事先寫好 using System.Web.Configuration ----
        //---- (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();

        SqlDataReader dr = null;
        //SqlCommand cmd = new SqlCommand("select [name], [password] from db_user where [name] = '" + TextBox1.Text + "' and [password] = '" + TextBox2.Text + "'", Conn);
        //*** 請注意資料隱碼攻擊（SQL Injection攻擊）***。改用下列參數寫法比較安全。
        SqlCommand cmd = new SqlCommand("select id, [name], [password], enable_time from db_user where [name] = @nm and [password] = @passwd", Conn);
        cmd.Parameters.AddWithValue("@nm", TextBox1.Text);
        cmd.Parameters.AddWithValue("@passwd", TextBox2.Text);

        dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

        if (!dr.HasRows)
        {
            Response.Write("<h2>帳號或是密碼有錯！</h2>");

            cmd.Cancel();
            //----關閉DataReader之前，一定要先「取消」SqlCommand
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            Response.End();   //--程式暫停。或是寫成 Exit Sub，脫離這個事件。
        }
        else
        {
            Session["Login"] = "OK";
            //--帳號密碼驗證成功，才能獲得這個 Session("Login") = "OK" 鑰匙

            //*************
            dr.Read();
            //*************
            Session["u_name"] = dr["name"].ToString();
            Session["u_passwd"] = dr["password"].ToString();

            cmd.Cancel();
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            Response.Redirect("Session_Login_end.aspx");
            //--帳號密碼驗證成功，導向另一個網頁。
        }
    }
}