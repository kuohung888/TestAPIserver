using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的----


public partial class Book_Sample_Ch11_User_Control_UC_Samples_UC_User_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       //----上面已經事先寫好 System.Web.Configuration命名空間 ----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString.ToString());

        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("Select * from db_user where [name] = " + TextBox1.Text + " and [password] = " + TextBox2.Text, Conn);
        // 注意資料隱碼攻擊（SQL Injection）。請用參數法來寫作。修改如下：
        //SqlCommand cmd = new SqlCommand("Select * from db_user where [name] = @name and [password] = @password", Conn);
        //cmd.Parameters.AddWithValue("@name", TextBox1.Text);
        //cmd.Parameters.AddWithValue("@password", TextBox2.Text);

            Conn.Open();   //---- 這時候才連結DB

            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

        if (dr.HasRows)
        {
            Session["Login"] = "OK";
            dr.Read();
            Session["u_name"] = dr["name"];
            Session["u_passwd"] = dr["password"];
            Session["u_rank"] = dr["rank"];

            cmd.Cancel();
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            Response.Redirect("UC_User_End001.aspx");
        }
        else
        {
            cmd.Cancel();
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            Response.Write("<h3>帳號或密碼有錯！</h3>");
            Response.End();
        }
    }
}