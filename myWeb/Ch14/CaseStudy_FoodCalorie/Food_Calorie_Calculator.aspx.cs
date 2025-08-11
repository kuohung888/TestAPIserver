using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的（宣告）----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告）----



public partial class Book_Sample_Ch14_CaseStudy_FoodCalorie_Food_Calorie_Calculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "-1")
        {
            Response.Write("您尚未選取DropDownList1任何一個選項");
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //----上面已經事先寫好 Imports System.Web.Configuration ----
        //----連結資料庫----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;
        String sqlstr = "select food_calorie from food_calorie where id = " + DropDownList1.SelectedValue;
        SqlCommand cmd = new SqlCommand(sqlstr, Conn);
        try
        {

            Conn.Open();   //---- 連結DB
            int food_calorie  = (int)cmd.ExecuteScalar();   //---- 執行SQL指令，取出資料

            //-- 計算卡路里
            Label1.Text = (Convert.ToInt32(TextBox1.Text) * food_calorie).ToString();
        }
        catch(Exception ex)  //---- 如果程式有錯誤或是例外狀況，將執行這一段
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
            throw;
        }
        finally
        {
            //--- Always call Close when done reading.
            if (dr!=null) 
            {
                cmd.Cancel();                //----關閉DataReader之前，一定要先「取消」SqlCommand
                dr.Close();
            }
            //---- Close the connection when done with it.
            if (Conn.State == ConnectionState.Open) 
            {
                Conn.Close();
                Conn.Dispose();
            }
        }


    }

}