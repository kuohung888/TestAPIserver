using System;
using System.Collections;
using System.Configuration;   //自己寫的
using System.Data;    //自己寫的
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch14_Default_book_5_Add_Manual_Parameter : System.Web.UI.Page
{
    protected void myDBInit()
    {
        //====從資料庫連結開始，100%都用手寫程式====
        SqlDataSource SqlDataSource1 = new SqlDataSource();
        //== 連結資料庫的連接字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        //== 撰寫SQL指令 ==
        SqlDataSource1.SelectCommand = "SELECT * FROM [test] order by id DESC";

        //== 執行SQL指令 .select() ==
        SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataSet;
        DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());

        //==================
        GridView1.DataSource = dv;
        GridView1.DataBind();
        //==================

        SqlDataSource1.Dispose();
    }
    //=======================================================================

    protected void Page_Load(object sender, EventArgs e)
    {
        myDBInit();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 資料新增 ==
        SqlDataSource SqlDataSource3 = new SqlDataSource();

        //== 連結資料庫的連接字串 ConnectionString  ==
        SqlDataSource3.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

        //== 改用參數 (InsertParameters)來進行輸入！ ==
        SqlDataSource3.InsertParameters.Add("title", TextBox1.Text);
        SqlDataSource3.InsertParameters.Add("test_time", DateTime.Now.ToShortDateString());
        SqlDataSource3.InsertParameters.Add("class", ListBox1.SelectedItem.Value);
        SqlDataSource3.InsertParameters.Add("summary", TextBox2.Text);
        SqlDataSource3.InsertParameters.Add("article", TextBox3.Text);
        SqlDataSource3.InsertParameters.Add("author", TextBox4.Text);

        //== 撰寫SQL指令(Insert Into) ==
        SqlDataSource3.InsertCommand = "Insert into test(title,test_time,class,summary,article,author) values(@title,@test_time,@class,@summary,@article,@author)";
        

        //== 執行SQL指令 / 新增 .Insert() ==
        int aff_row = SqlDataSource3.Insert();

        if (aff_row == 0)
            Response.Write("資料新增失敗！");
        else
            Response.Write("資料新增成功！");


        myDBInit();    //== GridView的資料重整
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        myDBInit();    //== GridView的資料重整
    }
}
