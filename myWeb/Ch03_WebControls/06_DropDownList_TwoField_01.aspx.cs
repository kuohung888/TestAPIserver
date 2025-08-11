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


public partial class Book_Sample_Ch03_WebControls_6_DropDownList_TwoField_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection();
        //----上面已經事先寫好 using System.Web.Configuration ----
        Conn.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

        SqlDataReader dr = null;

        //==重點！！== 透過SQL指令解決！==
        SqlCommand cmd = new SqlCommand("select id, title, author, title+author as NewField from test", Conn);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            Conn.Open();   //---- 這時候才連結DB
            dr = cmd.ExecuteReader();
            //dr.Read()

            DropDownList1.DataTextField = "NewField";  //==重點！！==
            DropDownList1.DataValueField = "id";

            DropDownList1.DataSource = dr;
            DropDownList1.DataBind();
        }
        catch (Exception ex)        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
        }
        finally        {
            if (dr != null)            {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                dr.Close();
            }

            if (Conn.State == ConnectionState.Open)            {
                Conn.Close();
                Conn.Dispose();
            }
        }
    }
}