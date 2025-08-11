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

public partial class Book_Sample_Ch09_GridView_Multi_PK_3_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //====自己手寫的程式碼， DataAdapter / DataSet ====(Start)
        //----上面已經事先寫好 Using System.Web.Configuration; ----
        //----連結資料庫
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        SqlDataAdapter myAdapter = new SqlDataAdapter("select * from test where id = " + GridView1.SelectedDataKey.Values[0] + " and title = '" + GridView1.SelectedDataKey.Values[1] + "'", Conn);

        DataSet ds = new DataSet();

        try  //==== 以下程式，只放「執行期間」的指令！====
        {
            //Conn.Open();   //---- 不用寫，DataAdapter會自動開啟

            myAdapter.Fill(ds, "test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。

            GridView2.DataSource = ds;     //----標準寫法 GridView2.DataSource = ds.Tables("test").DefaultView ----
            GridView2.DataBind();
        }
        catch(Exception ex)
        {
            Response.Write("<HR/> Exception Error Message----  " + ex.ToString());
        }
        finally
        {
            //---- 不用寫，DataAdapter會自動關閉
            //if (Conn.State == ConnectionState.Open)
            //{
            //   Conn.Close();
            //   Conn.Dispose();
            //}
        }


    }
}