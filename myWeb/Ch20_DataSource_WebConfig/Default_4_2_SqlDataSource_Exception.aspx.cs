using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的 NameSpace----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的----


public partial class Book_Sample_Ch14_Default_4_2_SqlDataSource_Exception : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //--------------------------------------------------
        //-----  手動撰寫 SqlDataSource  -----
        //--------------------------------------------------
        //== 1.資料庫的連線字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

        //== 2.撰寫SQL指令 ==
        SqlDataSource1.SelectCommand = "SELECT * FROM [test123]";
        //-- SQL指令裡面，故意寫錯字

        //***********************************
        GridView1.DataSourceID = "SqlDatasource1";
        //***********************************

        SqlDataSource1.Dispose();

    }


    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //== 執行 SqlDataSource的 .Select()方法之後，就會執行這一個事件 ==

        e.ExceptionHandled = true;  //--表示我們自己處理例外狀況（exception）！

        if (e.Exception != null) 
        {
            Response.Write("發生例外狀況 ---- " + e.Exception.Message);
        }

    }
}