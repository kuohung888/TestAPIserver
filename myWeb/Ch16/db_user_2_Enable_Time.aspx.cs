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

public partial class Book_Sample_B12_Member_Login_Session_db_user_2_Enable_Time : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label4.Text = "<big>修改成功！！！</big>";

        DetailsView1.DefaultMode = DetailsViewMode.ReadOnly;
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {  //*** 輸入的密碼，不可以跟舊密碼重複 ***
        TextBox TB = (TextBox)DetailsView1.FindControl("TextBox1");

        String str = OldPasswordList();   //自己寫的函式。進資料庫找出以前的舊密碼。

        if (str == "**EOF**")
            Label4.Text = "抱歉！EOF 查無記錄！";
        else
        {
            if (str.IndexOf(TB.Text) >= 0)
                Label4.Text = "<big>Sorry，與舊密碼重複，請使用其他密碼！！</big>";
            else
                Label4.Text = "<big>OK！！新密碼沒問題啦～</big>";
        }

    }



    //====================================================
    protected String OldPasswordList()
    {
        //----上面已經事先寫好 using System.Web.Configuration ----
        //---- (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();

        SqlDataReader dr = null;
        //SqlCommand cmd = new SqlCommand("select [name], [password] from db_user where [name] = '" + TextBox1.Text + "' and [password] = '" + TextBox2.Text + "'", Conn);
        //*** 請注意資料隱碼攻擊（SQL Injection攻擊）***。改用下列參數寫法比較安全。
        SqlCommand cmd = new SqlCommand("select old_password from db_user where [name] = @nm and [password] = @passwd", Conn);
        cmd.Parameters.AddWithValue("@nm", Session["u_name"].ToString());
        cmd.Parameters.AddWithValue("@passwd", Session["u_passwd"].ToString());

        dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

        if (!dr.HasRows)
        {
            Label4.Text = "<big>帳號或是密碼有錯！</big>";

            cmd.Cancel();
            //----關閉DataReader之前，一定要先「取消」SqlCommand
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            return "**EOF**";
        }
        else
        {
            //*************
            dr.Read();
            //*************
            String result = dr["old_password"].ToString();
            
            cmd.Cancel();
            dr.Close();
            Conn.Close();
            Conn.Dispose();

            ////Response.Write("<h3>密碼尚未到期</h3>");
            //Response.Redirect("Session_Login_end.aspx");
            //--帳號密碼驗證成功，導向另一個網頁。

            return result;
        }

    }


}