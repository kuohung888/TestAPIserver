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

public partial class Book_Sample_Ch11_GridView_inside_DropDownList_2_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        mis2000lab();
    }


     //****************************************************************(Start)***   
    protected void mis2000lab()
    {
        //**** db_user資料表的性別欄位，與RadioButtonList進行搭配 ****
        String u_sex, sqlstr = null; 
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString.ToString());
        
        try
        {
            Conn.Open();
            //----重點(start)--------------------------------------------------------------
            for (int i= 0; i < GridView1.Rows.Count; i++)
            {

                sqlstr = "select sex from db_user where id = " + GridView1.DataKeys[i].Value;
                SqlCommand cmd  = new SqlCommand(sqlstr, Conn);
                u_sex = (String)cmd.ExecuteScalar();   //-- 這時候執行SQL指令，取出資料
                // 只取出一個數值的時候，使用 .ExecuteScalar()來作，速度比較快！
                // 也不需用到 DataReader (dr)。

                RadioButtonList u_radio = (RadioButtonList)GridView1.Rows[i].FindControl("RadioButtonList1");
                if (u_radio.Items[0].Value == u_sex.ToString())   {
                    u_radio.Items[0].Selected = true;
                    //--因為RadioButtonList1只有「男」、「女」兩個子選項
                }
                else  {
                    u_radio.Items[1].Selected = true;  
                }

                cmd.Cancel();  //--關閉資源
                cmd.Dispose();
              }
            //----重點(end)---------------------------------------------------------------
        }
        catch(Exception ex)
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
        } 
        finally
        {
            Conn.Close();
            Conn.Dispose();
        }
         //****************************************************************(End)***   
    }
}