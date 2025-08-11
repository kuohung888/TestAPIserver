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

public partial class Ch14_Default_4_5_SqlDataSource_Manual : System.Web.UI.Page
{
   protected void myDBInit()  //==== 自己寫的程式 ====
    {
        //--------------------------------------------------
        //-----  手動撰寫 SqlDataSource  -----
        //--------------------------------------------------
        SqlDataSource SqlDataSource1 = new SqlDataSource();
        //==自己手動撰寫 SqlDataSource  ,必須先寫下面三行 ==

        //== 1.連結資料庫的連接字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        
        //== 2.撰寫SQL指令 ==
        SqlDataSource1.SelectCommand = "SELECT * FROM [test]";
        
        SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataSet;
        //== 如果 DataSourceMode 屬性設為 DataSet 值，則 Select 方法會傳回 DataView 物件。
        //== 如果 DataSourceMode 屬性設為 DataReader 值，則會傳回 IDataReader 物件。
        //     當完成讀取資料時，請關閉 IDataReader 物件。

        //== 3.執行SQL指令 .select() ==
        DataSourceSelectArguments args = new DataSourceSelectArguments();
        DataView dv = (DataView)SqlDataSource1.Select(args);
        //== 或是寫成一行 Data.DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
        //== DataSourceSelectArguments 提供一項機制，讓資料繫結控制項於擷取資料時，用來向資料來源控制項要求資料相關的作業。
        //== http://msdn2.microsoft.com/zh-tw/library/system.web.ui.webcontrols.sqldatasource.select(VS.80).aspx
        
        //=============================
        GridView1.DataSource = dv;
        GridView1.DataBind();
        //=============================
        SqlDataSource1.Dispose();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            myDBInit();
            Response.Write("第一次進入畫面.....if (!Page.IsPostBack).....<br>");
        }            
        else
        {
            Response.Write("第<b>N</b>次進入畫面.....<br>");
        }
    }


    //==== 更新（Update） ============================================
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {        
        //==註解：Cells(0)指的是: GridView 第一格「更新、取消」的功能，"並非" 資料庫的欄位！==
        //==畫面的GridView設定「DataKeyNames="id"」屬性之後，「資料庫索引鍵」這一格（以下例子為Cells[1]）就會變成「唯讀」！不可抓取使用！==

        //下面註解的這幾行，初學者可以打開來看。會更瞭解每一段程式的功用
        //TextBox myTest1 = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
        //TextBox myTest2 = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
        //Response.Write("<font color=darkgreen>");
        //Response.Write("GridView1.Rows[e.RowIndex].Cells[2].Controls[0].Text 選取的那一列，第三格---" + myTest1.Text + "<br>");
        //Response.Write("GridView1.Rows[e.RowIndex].Cells[4].Controls[0].Text 選取的那一列，第四格---" + myTest2.Text + "<br>");

        //Response.Write("GridView1.SelectedIndex.ToString---" + GridView1.SelectedIndex.ToString() + "<br>");
        //Response.Write("e.RowIndex---" + e.RowIndex + "<br>");

        //==畫面的GridView必須設定「DataKeyNames="id"」屬性，下面這一行程式才會運作。==
        //Response.Write("GridView1.DataKeys[e.RowIndex].Value 您選取的那一列，對應的「資料庫索引鍵」為---" + GridView1.DataKeys[e.RowIndex].Value + "<br>");
        //Response.Write("</font><hr />");
        //==========================================
        Response.Write("GridView1_RowUpdating()....開始更新資料....<br>");


        TextBox my_test_time, my_title, my_summary, my_article;
                    //先定義 TextBox物件！
        my_test_time = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
        my_title = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0];
        my_summary = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
        my_article = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0];

        int my_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);   //====主索引鍵====

        SqlDataSource SqlDataSource1 = new SqlDataSource();
        //== 連結資料庫的連接字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

        //SqlDataSource1.UpdateParameters.Clear();
        //== 設定SQL指令將會用到的參數 ==
        DateTime strDate = DateTime.Parse(my_test_time.Text);
        SqlDataSource1.UpdateParameters.Add("test_time", String.Format("{0:yyyy/MM/dd}", strDate));
        //== 日期格式需要轉換。String.Format()
        //==參考資料 http://forums.asp.net/t/314534.aspx/1?FormatDateTime+
        //==              http://www.csharp-examples.net/string-format-datetime/

        //下面的寫法也可以！
        //  SqlDataSource1.UpdateParameters.Add(new Parameter("test_time",TypeCode.DateTime));
        //  SqlDataSource1.UpdateParameters["test_time"].DefaultValue = my_test_time.Text; 

        SqlDataSource1.UpdateParameters.Add("title", my_title.Text.ToString());
        SqlDataSource1.UpdateParameters.Add("summary", my_summary.Text.ToString());
        SqlDataSource1.UpdateParameters.Add("article", my_article.Text.ToString());

        SqlDataSource1.UpdateParameters.Add("id", my_id.ToString()); 
        //下面的寫法也可以！
        //  SqlDataSource1.UpdateParameters.Add(new Parameter("id",TypeCode.Int32));
        //  SqlDataSource1.UpdateParameters["id"].DefaultValue = my_id.ToString();

        SqlDataSource1.UpdateCommand = "UPDATE [test] SET [test_time] = @test_time, [title] = @title, [summary] = @summary, [article] = @article WHERE [id] = @id";        
        SqlDataSource1.Update();  //執行SQL指令--Update陳述句

        SqlDataSource1.Dispose();

        //==== 更新完成後，離開編輯模式 ====
        GridView1.EditIndex = -1;
        myDBInit();
    }



    //==== 編輯 ============================================
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        myDBInit();
        Response.Write("GridView1_RowEditing()....進入編輯模式....<br>");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        myDBInit();
        Response.Write("GridView1_RowCancelingEdit()....離開(取消)編輯模式....<br>");
    }


    //==== 刪除 ============================================
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataSource SqlDataSource1 = new SqlDataSource();
        //== 連結資料庫的連接字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

        int my_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);    //====主索引鍵====
        //== 設定SQL指令將會用到的參數 ==
        SqlDataSource1.DeleteParameters.Add(new Parameter("id", TypeCode.Int32));
        SqlDataSource1.DeleteParameters["id"].DefaultValue = my_id.ToString();

        SqlDataSource1.DeleteCommand = "Delete from [test] WHERE [id] = @id";
        SqlDataSource1.Delete();

        Response.Write("*** 刪除成功！ ***");

        //----「刪除」已經完成！！記得重新整理畫面，重新載入資料----
        myDBInit();
    }



    //==== 分頁 ============================================
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        myDBInit();
        Response.Write("GridView1_PageIndexChanging()....分頁ing...<br>");
    }
    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        Response.Write("GridView1_PageIndexChanged()....分頁完成<br>");
    }    
}

