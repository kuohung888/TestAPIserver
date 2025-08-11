using System;
using System.Collections;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
//*********************************自己加寫（宣告）的NameSpace
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
//*********************************


public partial class Ch10_Default_2_DataSet_Manual : System.Web.UI.Page
{

    //==== 這一段程式很常被用到，所以獨立寫成一個 DBInit副程式。
    //==== 這樣會讓程式的可讀性提高！
    protected void DBInit()   //====自己手寫的程式碼， DataAdapter / DataSet ====(Start)
    {
        //上面已經事先寫好Using System.Web.Configuration; 
        //資料庫的連線字串，已經事先寫好，存放在 Web.Config檔案裡。
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter("select id,test_time,title,author from test", Conn);

        DataSet ds = new DataSet();

        try  //==== 以下程式，只放「執行期間」的指令！====
        {
            //----(1). 連結資料庫----
            //Conn.Open();  //---- 這一行註解掉，不用寫，DataAdapter會自動開啟

            //作者註解：SqlDataAdapter的 .Fill()方法使用 SQL指令的SELECT，從資料來源擷取資料。
            //   此時，DbConnection物件（如Conn）必須是有效的，但不需要是開啟的
            //  （因為DataAdapter會自動開啟或關閉連結）。
            //   如果在呼叫 .Fill ()方法之前關閉 IDbConnection，它會先開啟連接以擷取資料，
            //   然後再關閉連接。如果在呼叫 .Fill ()方法之前開啟連接，它會保持開啟狀態。
            //   因此，我們使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。

            //----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test");    //這時候執行SQL指令。取出資料，放進 DataSet。
            //---- DataSet是由許多 DataTable組成的，我們目前只放進一個名為 test的 DataTable而已。

            //----(3). 自由發揮。由 GridView來呈現資料。----
            GridView1.DataSource = ds;     //標準寫法 GridView1.DataSource = ds.Tables["test"].DefaultView
            GridView1.DataBind();

            //---- 最後，不用寫 Conn.Close()，因為DataAdapter會自動關閉
        }
        catch (Exception ex)
        {
            Response.Write("<hr /> Exception Error Message----  " + ex.ToString());
        }
        //finally
        //{   
        //----(4). 釋放資源、關閉連結資料庫----
        //---- 不用寫，DataAdapter會自動關閉
        //    if (Conn.State == ConnectionState.Open)  {
        //          Conn.Close();
        //          Conn.Dispose();
        //    }  //使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。
        //}
    }   //====自己手寫的程式碼， DataAdapter / DataSet ====(End)



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DBInit();   //---只有[第一次]執行本程式，才會進入 if判別式內部。
        }
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {   //==========================================================
        //----修改、更新
        //----    參考資料  http://msdn2.microsoft.com/zh-tw/library/33y2221y(VS.80).aspx
        //==========================================================
        //----因為前面有三個「功能鍵(編輯、選取、刪除)」，所以Cells[ ]從零算起，需扣掉前三個功能鍵與 id欄位。
        TextBox my_test_time, my_title, my_author;
        //先定義三個 TextBox物件！
        my_test_time = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0];
        my_title = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
        my_author = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0];

        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter();

        //----------------------事先寫好 UpdateCommand / DeleteCommand / InsertCommand
        myAdapter.UpdateCommand = new SqlCommand("update [test] set [test_time] = @test_time, [title] = @title, [author] = @author where [id] = @id", Conn);



        //********************************************************************
        //-----方法A！----------------------------------(請任選其一)
        //Conn.Open();
        ////==== 上面的SQL指令，有四個參數（前面有＠符號標示）。寫在下面：
        ////----下面 [日期格式] 如果不修正，會發生錯誤！        
        //myAdapter.UpdateCommand.Parameters.Add("@test_time", SqlDbType.DateTime);
        //myAdapter.UpdateCommand.Parameters["@test_time"].Value = DateTime.Parse(my_test_time.Text);     //強制轉換成日期
        ////寫成這樣也可以～  myAdapter.UpdateCommand.Parameters["@test_time"].Value = Convert.ToDateTime(my_test_time.Text);

        ////----以下是「參數」
        ////----    參考資料：  http://msdn2.microsoft.com/zh-tw/library/system.data.sqlclient.sqlcommand.parameters.aspx
        //myAdapter.UpdateCommand.Parameters.Add("@title", SqlDbType.VarChar, 50);
        //myAdapter.UpdateCommand.Parameters["@title"].Value = my_title.Text;

        //myAdapter.UpdateCommand.Parameters.Add("@author", SqlDbType.VarChar, 50);
        //myAdapter.UpdateCommand.Parameters["@author"].Value = my_author.Text;

        //myAdapter.UpdateCommand.Parameters.Add("@id", SqlDbType.Int, 4);
        //myAdapter.UpdateCommand.Parameters["@id"].Value = (int)GridView1.DataKeys[e.RowIndex].Value;
        ////---- GridView1.DataKeys(e.RowIndex).Value 是指：「使用者點選的那一列」資料，所對應的資料表「主索引鍵（Primary Key）值」。

        //myAdapter.UpdateCommand.ExecuteNonQuery();   //執行上面的SQL指令去作Update。
        //myAdapter.Dispose();
        //Conn.Close();   // 這種寫法類似DataReader，直接執行SQL指令，所以仍須自己關閉資料庫的連結。

        //-----方法B！----------------------------------(請任選其一)
        DataSet ds = new DataSet();
        myAdapter.SelectCommand = new SqlCommand("select * from test", Conn);
        myAdapter.Fill(ds, "test");

        //---- 直接修改 DataSet的內容 --------------------------------
        ds.Tables["test"].Rows[e.RowIndex]["test_time"] = my_test_time.Text;
        ds.Tables["test"].Rows[e.RowIndex]["title"] = my_title.Text;
        ds.Tables["test"].Rows[e.RowIndex]["author"] = my_author.Text;

        //==== 上面的SQL指令，有四個參數（前面有＠符號標示）。寫在下面：
        //----下面 [日期格式] 需要修正！！        
        myAdapter.UpdateCommand.Parameters.Add("@test_time", SqlDbType.DateTime);
        myAdapter.UpdateCommand.Parameters["@test_time"].Value = Convert.ToDateTime(my_test_time.Text);

        //----以下是「參數」
        myAdapter.UpdateCommand.Parameters.Add("@title", SqlDbType.VarChar, 50);
        myAdapter.UpdateCommand.Parameters["@title"].Value = my_title.Text;

        myAdapter.UpdateCommand.Parameters.Add("@author", SqlDbType.VarChar, 50);
        myAdapter.UpdateCommand.Parameters["@author"].Value = my_author.Text;

        myAdapter.UpdateCommand.Parameters.Add("@id", SqlDbType.Int, 4);
        myAdapter.UpdateCommand.Parameters["@id"].Value = (int)GridView1.DataKeys[e.RowIndex].Value;
        //---- GridView1.DataKeys[e.RowIndex].Value 是指：「使用者點選的那一列」資料，所對應的資料表「主索引鍵（Primary Key）值」。
        // 如果有多個主索引鍵，程式可以寫成：
        // 第一種寫法。GridView1.DataKeys[e.RowIndex].Values[索引號]
        // 第二種寫法。e.Keys[索引號]。此為RowDeleting事件專用。

        myAdapter.Update(ds, "test");    //把改寫後的DataSet，回寫到實體的資料庫裡面！
        //********************************************************************


        //==========================================================
        //===  另外一種寫法，透過SqlCommandBuilder自動產生 Update / Delete / Insert等相關指令
        //==========================================================
        //SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString.ToString());
        //Conn.Open();  //----不需要設定資料庫的連結與關閉，因為DataAdapter會自行處理
        //
        //SqlDataAdapter myAdapter = new SqlDataAdapter("select id,test_time,title,author from test", Conn);

        //-----透過SqlCommandBuilder自動產生 Update / Delete / Insert等相關指令------------------------
        //-----必須寫在[Select]的SQL指令完成後，才能自動產生 Update / Delete / Insert等---------
        //-----缺點：SqlCommandBuilder 比對的參數太多了，在大量作業時可能會拖慢效能。-----
        //-----         SqlCommandBuilder 只針對[單一表格]方可正常運作，並無法處理複雜的 Join資料表格 ----  
        //SqlCommandBuilder mySQLComBuild = new SqlCommandBuilder(myAdapter);
        //---------------------------------------------------------------------------------------------------------------------------------
        //DataSet ds = new DataSet();
        //myAdapter.Fill(ds, "test");

        //----------------------直接修改 DataSet的內容--------------------------------
        //ds.Tables["test"].Rows[e.RowIndex]["test_time"] = my_test_time.Text;
        //ds.Tables["test"].Rows[e.RowIndex]["title"] = my_title.Text;
        //ds.Tables["test"].Rows[e.RowIndex]["author"] = my_author.Text;

        //myAdapter.Update(ds, "test");  //--把改寫後的DataSet，回寫到實體的資料庫裡面！
        //myAdapter.Dispose();
        //==========================================================


        //----修改、更新完成！！離開「編輯」模式  ----
        GridView1.EditIndex = -1;
        DBInit();
    }


    //==============================================
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {   //----分頁 Start----
        GridView1.PageIndex = e.NewPageIndex;
        DBInit();
    }


    //==============================================
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {   //----編輯模式----
        GridView1.EditIndex = e.NewEditIndex;
        DBInit();
        //----畫面上的GridView，已經事先設定好「DataKeyName」屬性 = id ----
        //----所以編輯時，主索引鍵id 欄位會自動變成「唯讀」----
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {   //---離開「編輯」模式----
        GridView1.EditIndex = -1;
        DBInit();
    }


    //==============================================
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {   //======================================================
        //----刪除一筆資料
        //----    參考資料：http://msdn2.microsoft.com/zh-tw/library/system.data.sqlclient.sqldataadapter.deletecommand(VS.80).aspx
        //======================================================
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter();

        //---- 事先寫好 UpdateCommand / DeleteCommand / InsertCommand
        myAdapter.DeleteCommand = new SqlCommand("delete from [test] where [id] = @id", Conn);
        // 如果有多個主索引鍵，程式可以寫成：
        // 第一種寫法。GridView1.DataKeys[e.RowIndex].Values[索引號]
        // 第二種寫法。e.Keys[索引號]。此為RowDeleting事件專用。


        //********************************************************************
        //-----方法A！----------------------------------(請任選其一)
        //Conn.Open();

        //    //----以下是「參數」
        //    myAdapter.DeleteCommand.Parameters.Add("@id", SqlDbType.Int, 4);
        //    myAdapter.DeleteCommand.Parameters["@id"].Value = (int)GridView1.DataKeys[e.RowIndex].Value;
        //    //---- GridView1.DataKeys[e.RowIndex].Value 是指：「使用者點選的那一列」資料，所對應的資料表「主索引鍵（Primary Key）值」。

        //myAdapter.DeleteCommand.ExecuteNonQuery();  //執行上面的SQL指令去作Delete。
        //myAdapter.Dispose();
        //Conn.Close();   // 這種寫法類似DataReader，直接執行SQL指令，所以仍須自己關閉資料庫的連結。

        //-----方法B！----------------------------------(請任選其一)
        DataSet ds = new DataSet();
        myAdapter.SelectCommand = new SqlCommand("select * from test", Conn);
        myAdapter.Fill(ds, "test");

        //---- 直接修改 DataSet的內容 --------------------------------
        ds.Tables["test"].Rows[e.RowIndex].Delete();
        
            //----以下是「參數」
            myAdapter.DeleteCommand.Parameters.Add("@id", SqlDbType.Int, 4);
            myAdapter.DeleteCommand.Parameters["@id"].Value = (int)GridView1.DataKeys[e.RowIndex].Value;
            //---- GridView1.DataKeys[e.RowIndex].Value 是指：「使用者點選的那一列」資料，所對應的資料表「主索引鍵（Primary Key）值」。
        
        myAdapter.Update(ds, "test");
        //把改寫後的DataSet，回寫到實體的資料庫裡面！
        //********************************************************************

        //----「刪除」已經完成！！記得重新整理畫面，重新載入資料----
        DBInit();
    }
}
