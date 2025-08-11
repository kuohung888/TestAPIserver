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

public partial class Ch14_Default_4_3_SqlDataSource_Manual_DataReader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //--------------------------------------------------
        //-----  手動撰寫 SqlDataSource  -----
        //--------------------------------------------------
        SqlDataSource SqlDataSource1 = new SqlDataSource();

        //==自己手動撰寫 SqlDataSource  ,必須先寫下面三行 ==

        //== 1.資料庫的連線字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        //== 2.撰寫SQL指令 ==
        SqlDataSource1.SelectCommand = "SELECT * FROM [test]";
        //== 3.執行SQL指令 .select()    /  [DataReader 版]==
        SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
        //== 如果 DataSourceMode 屬性設為 DataReader 值，則會傳回 IDataReader 物件。
        //== 當完成讀取資料時，請關閉 IDataReader 物件。

        DataSourceSelectArguments args = new DataSourceSelectArguments();
        //== DataSourceSelectArguments 提供一項機制，讓資料繫結控制項於擷取資料時，用來向資料來源控制項要求資料相關的作業。

        ////==（方法一）
        //IDataReader IDR = (IDataReader)SqlDataSource1.Select(args);
        ////============================================
        //GridView1.DataSource = IDR;
        //GridView1.DataBind();
        ////============================================
        //IDR.Close();  //== 當完成讀取資料時，請關閉 IDataReader 物件。


        //==另一種寫法（方法二）
        GridView1.DataSource = SqlDataSource1.Select(args);
        GridView1.DataBind();        

        SqlDataSource1.Dispose();
    }
}
