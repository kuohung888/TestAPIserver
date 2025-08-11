using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----註解：記得在後置程式碼（CodeBehine）的最上面，寫這些NameSpace ----
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的---- 



public partial class Ch14_Default_4_SqlDataSource_Manual_DataBinding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource SqlDataSource1 = new SqlDataSource();

        //==自己手動撰寫 SqlDataSource  ,必須先寫下面三行 ==
        //== 1.資料庫的連線字串 ConnectionString。已經存放在Web.Config檔案內
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        
        //== 2.撰寫SQL指令 ==
        SqlDataSource1.SelectParameters.Add("id", TextBox1.Text);
        //SqlDataSource1.SelectParameters("id").DefaultValue = 5;
        SqlDataSource1.SelectCommand = "SELECT [id], [test_time], [title], [summary], [article], [author] FROM [test] WHERE ([id] = @id)";
        //== 3.執行SQL指令 .select()    /  [DataSet 版]==
        SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataSet;
        //== 如果 DataSourceMode 屬性設為 DataSet值，則 Select 方法會傳回 DataView 物件。

        DataSourceSelectArguments args = new DataSourceSelectArguments();
        DataView dv = new DataView();
        dv = (DataView)SqlDataSource1.Select(args);
        //== 型別 'System.Collections.IEnumerable' 不能隱含轉換為 'System.Data.DataView'。請強制轉換為 DataView。
        //== DataSourceSelectArguments 提供一項機制，讓資料繫結控制項於擷取資料時，用來向資料來源控制項要求資料相關的作業。

        GridView1.DataSource = dv;
        GridView1.DataBind();

    }
}
