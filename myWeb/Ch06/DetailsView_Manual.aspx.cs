using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的----



public partial class Book_Sample_Ch06_DetailsView_Manual : System.Web.UI.Page
{
    
    protected void DBInit()
    {   //====自己手寫的程式碼， DataAdapter / DataSet ====(start)

        //----上面已經事先寫好 using System.Web.Configuration ----
        //----連結資料庫的另一種寫法----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = null;

        try
        {
            //Conn.Open();  //---- 這一行註解掉，可以不用寫，DataAdapter會自動開啟
            //作者註解：SqlDataAdapter的 .Fill()方法使用 SQL指令的SELECT，從資料來源擷取資料。
            //   此時，DbConnection物件（如Conn）必須是有效的，但不需要是開啟的
            //  （因為DataAdapter會自動開啟或關閉連結）。
            //   如果在呼叫 .Fill ()方法之前關閉 IDbConnection，它會先開啟連接以擷取資料，
            //   然後再關閉連接。如果在呼叫 .Fill ()方法之前開啟連接，它會保持開啟狀態。
            //   因此，我們使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。


            //=====重 點=====
            myAdapter = new SqlDataAdapter("select id, test_time, class, title, summary, article, author from test", Conn);
            DataSet ds = new DataSet();
            myAdapter.Fill(ds, "test");   //把資料庫撈出來的資料，填入DataSet裡面。

            //----自行撰寫程式，把每一筆紀錄呈現在畫面上----------------------------------------------------------

            //---- DataSet是由許多 DataTable組成的，我們目前只放進一個名為 test的 DataTable而已。
            DataTable myTable = ds.Tables["test"];
            //作者註解： DataSet包含一或多個由資料列（Row）和資料行（Column，欄位）所組成的 
            // 「DataTable物件」集合，此集合中也可包含 DataTable物件中的主索引鍵、外部索引鍵、
            //  條件約束及資料的關聯資訊。

            DetailsView1.DataSource = ds;     //----標準寫法 GridView1.DataSource = ds.Tables("test").DefaultView ----
            DetailsView1.DataBind();
            //=====重 點=====
        }
        catch (Exception ex)
        {
            Response.Write("<HR/> Exception Error Message----  " + ex.ToString());
        }
        //finally
        //{  
        //    //---- 不用寫，DataAdapter會自動關閉
        //    if (Conn.State == ConnectionState.Open) 
        //    {
        //        Conn.Close();
        //        Conn.Dispose();
        //    }  //使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。
        //}
        //====自己手寫的程式碼， DataAdapter / DataSet ====(end)
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DBInit();   //---只有第一次執行本程式，才會進入 if判別式內部。
        }
    }


    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            Label_Msg.Text = "<font color=red>編輯（Edit）模式</font>";
            DetailsView1.ChangeMode(DetailsViewMode.Edit);  //==超級重點！！
            //-- ChangeMode()方法， 參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.detailsview.changemode.aspx
            //DetailsView1.DefaultMode = DetailsViewMode.Edit;
            //-- DefaultMode 參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.detailsview.defaultmode.aspx

            DetailsView1.AllowPaging = false;
            //-- 處於「編輯模式」，不可以有分頁。
            DBInit();
        }

        if (e.CommandName == "New")
        {
            Label_Msg.Text = "<font color=green>新增（Insert）模式</font>";
            DetailsView1.ChangeMode(DetailsViewMode.Insert);  //==超級重點！！
            //DetailsView1.DefaultMode = DetailsViewMode.Insert;

            DetailsView1.AllowPaging = false;
            //-- 處於「新增模式」，不可以有分頁。
            DBInit();
        }

        if (e.CommandName == "Cancel")
        {
            Label_Msg.Text = "<font color=green>你剛剛按下取消（Cancel）按鈕</font>";
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);  //==超級重點！！
            //DetailsView1.DefaultMode = DetailsViewMode.ReadOnly;

            DetailsView1.AllowPaging = true;
            DBInit();
        }
    }


    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        //----分頁----
        if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
        {
            //-- CurrentMode 參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.detailsview.currentmode.aspx
            //--分頁的時候，不可以使用「編輯模式」
            e.Cancel = true;
        }

        DetailsView1.PageIndex = e.NewPageIndex;
        Label_Msg.Text = "分頁（PageIndexChanging事件）.....目前是第" + e.NewPageIndex + "頁（頁數從[零]算起）";
        DBInit();
    }
    

    //**************************************************************
    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        // 這個事件就算不寫程式也可以，但一定要有！
        // 不然就會報錯！！
    }


    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //====自己手寫的程式碼， DataAdapter / DataSet ====(Start)
        //-- 資料更新的 ADO.NET程式碼，請您自己寫。
        //====自己手寫的程式碼， DataAdapter / DataSet ====(End)


        Label_Msg.Text = "<font color=green>你剛剛按下更新（Update）按鈕</font>";
        Response.Write("更新完畢-----Update");
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);  //==超級重點！！
        //DetailsView1.DefaultMode = DetailsViewMode.ReadOnly;

        DetailsView1.AllowPaging = true;
        DBInit();
    }
}