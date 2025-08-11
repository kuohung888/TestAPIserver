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


public partial class Book_Sample_Ch03_WebControls_dropdownlist_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //=======微軟SDK文件的範本=======
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        SqlDataReader  dr  = null;
        SqlCommand cmd = new SqlCommand("select id,title from test", Conn);

        try     //==== 以下程式，只放「執行期間」的指令！=====
        {
            Conn.Open();  //---- 這時候才連結DB

            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

            while(dr.Read())
            {
                //==只能加入  Text
                //DropDownList1.Items.Add(dr["title"]);

                //== 另一種作法，加入（Text, Value）
                DropDownList1.Items.Add(new ListItem(dr["title"].ToString(), dr["id"].ToString()));
            }
        }
        catch(Exception ex)   //---- 如果程式有錯誤或是例外狀況，將執行這一段
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }            
        finally
        {
            if (dr != null)
            {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx

                //--   http://msdn.microsoft.com/zh-tw/library/system.data.sqlclient.sqldatareader.close.aspx
                dr.Close();
            }

            if (Conn.State == ConnectionState.Open) 
            {
                Conn.Close();
                Conn.Dispose();  //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

    }
}