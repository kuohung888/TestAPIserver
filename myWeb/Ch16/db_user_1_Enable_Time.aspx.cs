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


public partial class Book_Sample_B12_Member_Login_Session_db_user_1_Enable_Time : System.Web.UI.Page
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

            Response.End();   //--程式暫停。或是寫成 return (C#)，脫離這個事件。
        }
        else
        {
            Session["Login"] = "OK";
            //--帳號密碼驗證成功，才能獲得這個 Session["Login"] = "OK" 鑰匙

            //*************
            dr.Read();
            Session["u_name"] = dr["name"].ToString();
            Session["u_passwd"] = dr["password"].ToString();
            //*************

            DateTime DT1 = System.DateTime.Now;
            DateTime DT2 = Convert.ToDateTime(dr["enable_time"]);

            ////測試用的程式碼！
            //Response.Write("今天的日期：" + DT1.ToShortDateString() + "<br>");
            //Response.Write("資料表- enable_time欄位的日期：" + DT2.ToShortDateString() + "<br><br>");

            //Response.Write("DateTime.Compare()方法傳回：小於零、零、大於零（DT1晚於DT2）：");
            //Response.Write("<h3>" + System.DateTime.Compare(DT1, DT2) + "</h3>");

            String URLstr = "db_user_2_Enable_Time.aspx?id=" + dr["id"];
                cmd.Cancel();
                dr.Close();
                Conn.Close();
                Conn.Dispose();

            ////參考資料：http://msdn.microsoft.com/zh-tw/library/system.datetime.compare(v=vs.110).aspx
            ////傳回三個數字：小於零、零、大於零（DT1晚於DT2）
            if (System.DateTime.Compare(DT1, DT2) >= 0)
            {
                Response.Write("<h3>密碼過期</h3>");
                Response.Redirect(URLstr);   //導向這個網址，必須修改密碼。因為密碼已經過期。
            }

            Response.Write("<h3>密碼尚未到期</h3>");
            //Response.Redirect("Session_Login_end.aspx");
            ////--帳號密碼驗證成功，導向另一個網頁。
        }

    }
}