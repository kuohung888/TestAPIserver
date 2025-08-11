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
using System.Text;  //for StringBuilder
//----自己寫的（宣告）----


public partial class _Book_New_Samples_DB_DataSet_Default_2_1_DataSet_Connection : System.Web.UI.Page
{

    //====自己手寫的程式碼， DataAdapter / DataSet ====(start)
    protected void DBInit()
    {
        //----上面已經事先寫好 using System.Web.Configuration ----
        //----連結資料庫的另一種寫法----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = null;

        try
        {
            //----(1). 連結資料庫----
            //Conn.Open();  //---- 這一行註解掉，可以不用寫，DataAdapter會自動開啟

            //作者註解：SqlDataAdapter的 .Fill()方法使用 SQL指令的SELECT，從資料來源擷取資料。
            //   此時，DbConnection物件（如Conn）必須是有效的，但不需要是開啟的
            //  （因為DataAdapter會自動開啟或關閉連結）。
            //   如果在呼叫 .Fill ()方法之前關閉 IDbConnection，它會先開啟連接以擷取資料，
            //   然後再關閉連接。如果在呼叫 .Fill ()方法之前開啟連接，它會保持開啟狀態。
            //   因此，我們使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。

            
            //=====重 點=====(start)
            myAdapter = new SqlDataAdapter("select id,test_time,title,author from test", Conn);
            DataSet ds = new DataSet();

            //----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test");   //把資料庫撈出來的資料，填入DataSet裡面。
            //---- DataSet是由許多 DataTable組成的，我們目前只放進一個名為 test的 DataTable而已。

            
            //***********************************
            //*** .Fill()方法之後，資料庫連線就中斷囉！ ***
            Response.Write("<hr />資料庫連線 Conn.State ---- " + Conn.State.ToString() + "<hr />");
            //***********************************


            //----(3). 自由發揮。由 GridView來呈現資料。----
            GridView1.DataSource = ds;
            //----標準寫法 GridView1.DataSource = ds.Tables["test"].DefaultView; ----
            GridView1.DataBind();
            //=====重 點=====(end)
        }
        catch(Exception ex) 
        {
            Response.Write("<HR />" + ex.ToString() + "<HR />");
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
    //====自己手寫的程式碼， DataAdapter / DataSet ====(end)
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DBInit();    //--網頁第一次執行的時候，才會運作到這一行！
        }
    }

}