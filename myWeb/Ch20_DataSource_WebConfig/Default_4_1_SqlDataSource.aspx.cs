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


public partial class Book_Sample_Ch14_Default_4_1_SqlDataSource : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //--------------------------------------------------
        //-----  手動撰寫 SqlDataSource  -----
        //--------------------------------------------------
        //== 1.資料庫的連線字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

        //== 2.撰寫SQL指令 ==
        SqlDataSource1.SelectCommand = "SELECT * FROM [test]";

        //***********************************
        GridView1.DataSourceID = "SqlDatasource1";
        //***********************************

        SqlDataSource1.Dispose();
    }
}