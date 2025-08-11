using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//===========================
using System.Data;              //  自己寫的（宣告）
//===========================



public partial class Ch06_Default_book_4_Add_Manual_Parameter : System.Web.UI.Page
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
        SqlDataSource SqlDataSource2 = new SqlDataSource();

        //== 連結資料庫的連接字串 ConnectionString  ==
        SqlDataSource2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

        //*********************************************************************
        //== 撰寫SQL指令(Insert Into) ==
        //==(使用參數來做，避免 SQL Injection攻擊)

        SqlDataSource2.InsertParameters.Add("myTitle", TextBox1.Text);
        SqlDataSource2.InsertParameters.Add("myTest_time", DateTime.Now.ToShortDateString());
        SqlDataSource2.InsertParameters.Add("myClass", ListBox1.SelectedItem.Value.ToString());
        SqlDataSource2.InsertParameters.Add("mySummary", TextBox2.Text);
        SqlDataSource2.InsertParameters.Add("myArticle", TextBox3.Text);
        SqlDataSource2.InsertParameters.Add("myAuthor", TextBox4.Text);

        SqlDataSource2.InsertCommand = "Insert into test(title,test_time,class,summary,article,author) values(@myTitle,@myTest_time,@myClass,@mysummary,@myArticle,@myAuthor)";
        //==使用 @參數的時候，前後沒有加上單引號（’）。

        //*********************************************************************
       
        //== 執行SQL指令 / 新增 .Insert() ==
                int aff_row = SqlDataSource2.Insert();

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