using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的----

public partial class Ch14_Default_4_4_SqlDataSource_Manual_DataSet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //--------------------------------------------------
        //-----  手動撰寫 SqlDataSource  -----
        //--------------------------------------------------
        SqlDataSource SqlDataSource1 = new SqlDataSource();

        //==自己手動撰寫 SqlDataSource  ,必須先寫下面三行 ==

        //== 1.資料庫的連線字串 ConnectionString  (已經存放在Web.Config檔案內)==
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        //== 2.撰寫SQL指令 ==
        SqlDataSource1.SelectCommand = "SELECT * FROM [test]";
        //== 3.執行SQL指令 .select()    /  [DataSet 版]==
        SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataSet;
        //== 如果 DataSourceMode 屬性設為 DataSet 值，則 Select 方法會傳回 DataView 物件。

        DataSourceSelectArguments args = new DataSourceSelectArguments();
        DataView dv = new DataView();
        dv = (DataView)SqlDataSource1.Select(args);
        //== 型別 'System.Collections.IEnumerable' 不能隱含轉換為 'System.Data.DataView'。請強制轉換為 DataView。
        //== DataSourceSelectArguments 提供一項機制，讓資料繫結控制項於擷取資料時，用來向資料來源控制項要求資料相關的作業。

        GridView1.DataSource = dv;
        GridView1.DataBind();

        SqlDataSource1.Dispose();
    }
}
