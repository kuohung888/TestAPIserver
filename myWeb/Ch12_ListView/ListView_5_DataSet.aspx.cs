using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的（宣告） NameSpace----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告） NameSpace----



public partial class Book_Sample_Ch12_ListView_ListView_5_DataSet : System.Web.UI.Page
{


    protected void  DBInit()   //--註解：這一段程式是自己手寫的。Dataset版。
    {
        //----連結資料庫---
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter("select top 10 * from test order by id DESC", Conn);
        DataSet ds = new DataSet();

        try
        {
            myAdapter.Fill(ds, "test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。

            ListView1.DataSource = ds;
            //----標準寫法 ListView1.DataSource = ds.Tables("test").DefaultView ----
            ListView1.DataBind();
        }
        catch(Exception ex)  //---- 如果程式有錯誤或是例外狀況，將執行這一段
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //--註解：只有第一次執行本程式，才會執行這一段。
            DBInit();
        }
    }


    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "my_Detail")
        {
            ListView1.SelectedIndex = -1;
            //--註解：「-1」代表離開「選取(Select)」按鈕的狀態！
            DBInit();
        }
    }


    protected void ListView1_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        ListView1.SelectedIndex = e.NewSelectedIndex;
        //--註解：點選某一篇文章後可以看見這一篇文章的細部內容。
        DBInit();
    }
}