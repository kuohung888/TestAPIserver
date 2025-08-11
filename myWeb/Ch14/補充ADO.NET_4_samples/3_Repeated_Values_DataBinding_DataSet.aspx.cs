using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----
public partial class Book_Sample_B06_DataBinding_Repeated_Values_DataBinding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //上面已經事先寫好Using System.Web.Configuration; 
        //資料庫的連線字串，已經事先寫好，存放在 Web.Config檔案裡。
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter("select top 5 id, title from test", Conn);

        DataSet ds = new DataSet();

        try  //==== 以下程式，只放「執行期間」的指令！====
        {
            //----(1). 連結資料庫----
            //Conn.Open();  //---- 這一行註解掉，不用寫，DataAdapter會自動開啟

            //----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test");    //這時候執行SQL指令。取出資料，放進 DataSet。
            //---- DataSet是由許多 DataTable組成的，我們目前只放進一個名為 test的 DataTable而已。

            //----(3). 自由發揮。由 畫面上的清單控制項來呈現資料。----
            CheckBoxList1.DataSource = ds;   //標準寫法 XXX.DataSource = ds.Tables["test"].DefaultView
            CheckBoxList1.DataBind();

            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();

            RadioButtonList1.DataSource = ds;
            RadioButtonList1.DataBind();   
        }
        catch (Exception ex)
        {
            Response.Write("<hr /> Exception Error Message----  " + ex.ToString());
        }
        //finally
        //{   
        //----(4). 釋放資源、關閉連結資料庫----
        //---- 不用寫，DataAdapter會自動關閉
        //    if (Conn.State == ConnectionState.Open)  {
        //          Conn.Close();
        //          Conn.Dispose();
        //    }  //使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。
        //}


    }
}