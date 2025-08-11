using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//===========================
using System.Web.Configuration;   //自己寫的（宣告）
using System.Data;
using System.Data.SqlClient;
//===========================


public partial class Book_Sample_B09_Manual_Input_GridView_Insert_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        if ((Check_InputData(TextBox2.Text)) | (Check_InputData(TextBox3.Text)) | (Check_InputData(TextBox4.Text)) | (Check_InputData(TextBox5.Text)))
        {
            Response.Write("出現可疑的字眼，程式中斷！");
            return;
            //或是 Response.End() 也行
        }


        //----連結資料庫的「連結字串」 ----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString.ToString());

        SqlCommand cmd = new SqlCommand("INSERT INTO [test]([test_time], [class], [title], [summary], [article], [author]) VALUES(getdate(), '" + DropDownList1.SelectedValue.ToString() + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "')", Conn);

        try  {
            Conn.Open();   //----(1). 這時候才連結DB
            int i = cmd.ExecuteNonQuery();   //----(2). 執行SQL指令，新增一筆資料

            if (i > 0)   {
                Label1.Text = "新增" + i + "筆資料！";   //----(3). 自由發揮、畫面。執行SQL指令，
                //----新增一筆資料之後，成功或是失敗，要在畫面上反映出來。
            }
            cmd.Cancel();

            //===============================================(start)
            //---- 新增完成後，重新整理 GridView，以呈現最新文章 --------------------------
            
            SqlCommand cmd_dr = new SqlCommand("Select Top 5 * from Test Order by id DESC", Conn);
            SqlDataReader dr  = cmd_dr.ExecuteReader();

            GridView1.DataSource = dr;
            GridView1.DataBind();

            if (dr != null)  {
                cmd_dr.Cancel();
                //---- 關閉DataReader之前，一定要先「取消」SqlCommand
                dr.Close();
            }
            //===============================================(end)
        }

        catch(Exception ex)   {  //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
        }

        finally
        {
            //----(4). 關閉DB的連結。
            //---- Close the connection when done with it.
            if (Conn.State == ConnectionState.Open)  {
                Conn.Close();
                Conn.Dispose();  //---- 一開始宣告有用到 new的,最後必須以 .Dispose()結束
           }
        }

    }


    protected Boolean Check_InputData(String u_input)
    {
        //-- 判斷輸入字串，是否有SQL Injection（資料隱碼）攻擊
        if (u_input.IndexOf("--", 0) != -1)   {
            return true;
         }

        if (u_input.IndexOf("1=1", 0) != -1)  {
            return true;
         }
        // Instr()是VB語法的函數。改成 C#的話，請看：
        // http://www.dotblogs.com.tw/mis2000lab/archive/2009/01/14/instr_function_090114.aspx
        // 找不到的話， 會傳回「-1」。
        // 找到的話，回傳一個 Integer數字（從 [零]算起）。表示在字串裡面第幾個字，符合條件。 

        return false;
    }
}