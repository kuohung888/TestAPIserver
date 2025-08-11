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


public partial class Book_Sample_Ch16_Case_MemberAdd_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        //*** 檢查會員的「帳號」是否重複？是否是新會員？
        //----上面已經事先寫好 Using System.Web.Configuration ----
        //---- (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();

        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select count(*) from db_user where [name] = @NM", Conn);
        //*** 請注意資料隱碼攻擊（SQL Injection攻擊）***
        cmd.Parameters.AddWithValue("@NM", TextBox1.Text);

        //方法一
        //dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料
        //方法二
        int i = (int)cmd.ExecuteScalar();

        //方法一
        //if (dr.HasRows)    //找到相同的帳號。
        //方法二
        if (i > 0)    //找到相同的帳號。
        {
            Response.Write("<h3><font color=green>***會員資料庫，已經有這個人" + TextBox1.Text + " ***</font></h3>");
        }
        else
        {
            Response.Write("<h3><font color=red>新會員，您好！歡迎加入~~~</font></h3>");
            
            Panel1.Visible = true;   //找不到這個會員，開始新增個人資料！
        }
        cmd.Cancel();
        //方法一 會用到的。
        //dr.Close();
        Conn.Close();
        Conn.Dispose();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //*** 會員登入（檢查帳號＆密碼）

        //----上面已經事先寫好 Using System.Web.Configuration ----
        //---- (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();

        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select [name], [password] from db_user where [name] = @NM and [password] = @passwd", Conn);
        //*** 請注意資料隱碼攻擊（SQL Injection攻擊）***
        cmd.Parameters.AddWithValue("@NM", TextBox1.Text);
        cmd.Parameters.AddWithValue("@passwd", TextBox2.Text);

        dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

        if (!dr.HasRows)
        {
            Response.Write("<h3>帳號或是密碼有錯！<br>");
            cmd.Cancel();
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            Response.Write("XXX 會員登入，失敗 XXX</h3>");
            //Response.End();   //--程式暫停。或是寫成 return，脫離這個事件。
        }
        else
        {
            Session["Login"] = "OK";
            //--帳號密碼驗證成功，才能獲得這個 Session["Login"] = "OK" 鑰匙

            dr.Read();
            Session["u_name"] = dr["name"].ToString();
            Session["u_passwd"] = dr["password"].ToString();

            cmd.Cancel();
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            Response.Write("<h3><font color=blue>會員登入，成功！！</font></h3>");
            //Response.Redirect("Session_Login_end.aspx");
            //--帳號密碼驗證成功，導向另一個網頁。
        }

    }


    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Panel1.Visible = false;
    }
}