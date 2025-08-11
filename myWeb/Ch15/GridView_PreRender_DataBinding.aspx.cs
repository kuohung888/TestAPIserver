using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//*********************************自己加寫（宣告）的NameSpace
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
//*********************************


public partial class Book_Sample_Ch15_GridView_PreRender_DataBinding : System.Web.UI.Page
{

    protected void DBInit()   //====自己手寫的程式碼， DataAdapter / DataSet ====(Start)
    {
        //上面已經事先寫好Using System.Web.Configuration; 
        //資料庫的連線字串，已經事先寫好，存放在 Web.Config檔案裡。
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter("select id,test_time,title,author from test", Conn);

        DataSet ds = new DataSet();

        try  //==== 以下程式，只放「執行期間」的指令！====
        {
            //----(1). 連結資料庫----
            //Conn.Open();  //---- 這一行註解掉，不用寫，DataAdapter會自動開啟

            //作者註解：SqlDataAdapter的 .Fill()方法使用 SQL指令的SELECT，從資料來源擷取資料。
            //   此時，DbConnection物件（如Conn）必須是有效的，但不需要是開啟的
            //  （因為DataAdapter會自動開啟或關閉連結）。
            //   如果在呼叫 .Fill ()方法之前關閉 IDbConnection，它會先開啟連接以擷取資料，
            //   然後再關閉連接。如果在呼叫 .Fill ()方法之前開啟連接，它會保持開啟狀態。
            //   因此，我們使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。

            //----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test");    //這時候執行SQL指令。取出資料，放進 DataSet。
            //---- DataSet是由許多 DataTable組成的，我們目前只放進一個名為 test的 DataTable而已。

            //----(3). 自由發揮。由 GridView來呈現資料。----
            GridView1.DataSource = ds;     //標準寫法 GridView1.DataSource = ds.Tables["test"].DefaultView
            GridView1.DataBind();

            //---- 最後，不用寫 Conn.Close()，因為DataAdapter會自動關閉
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
    //====自己手寫的程式碼， DataAdapter / DataSet ====(End)

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DBInit();   //---只有[第一次]執行本程式，才會進入 if判別式內部。
        }
    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        Response.Write("GridView的<font color=red>PreRender事件</font><hr />");
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        Response.Write("GridView，DataBinding完成！<br />");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //==== 分頁 ====
        GridView1.PageIndex = e.NewPageIndex;
        DBInit();
    }
}