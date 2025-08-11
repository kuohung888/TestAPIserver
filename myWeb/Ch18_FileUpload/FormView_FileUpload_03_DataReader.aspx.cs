using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己（宣告）寫的----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己（宣告）寫的----

public partial class Book_Sample_Ch18_FileUpload_FormView_FileUpload_03_DataReader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //== 參數的寫法，可以參考「上集 Ch.14」那一章，範例 RecordsAffected_01_Parameter_Delete.aspx。
        //== 這裡寫的比較簡單，但實務上，要小心資料隱碼攻擊（SQL Injection）。

        //== (1). 開啟資料庫的連結。
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();

        //== (2). 執行SQL指令。
        //********************************************(start)
        //*** 參數版（Parameter）
        SqlCommand cmd = new SqlCommand("INSERT INTO [FileUpload_DB] ([FileUpload_time], [test_id], [FileUpload_FileName], [FileUpload_Memo], [FileUpload_User]) VALUES (@FileUpload_time, @test_id, @FileUpload_FileName, @FileUpload_Memo, @FileUpload_User)", Conn);

        Calendar ca = (Calendar)FormView1.FindControl("Calendar1");
        cmd.Parameters.AddWithValue("FileUpload_time", ca.SelectedDate.ToShortDateString());

        TextBox tb1= (TextBox)FormView1.FindControl("test_idTextBox");
        cmd.Parameters.AddWithValue("test_id", tb1.Text);

        //==== 檔案上傳的程式，寫在這裡 ======================(start)==
        FileUpload FL= (FileUpload)FormView1.FindControl("FileUpload1");

        //-- 註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        String savePath = "D:\\temp\\uploads\\";
        String fileName = null;
        if (FL.HasFile) {
            fileName = FL.FileName;
            savePath = savePath + fileName;
            FL.SaveAs(savePath);
            Label1.Text = "上傳成功，檔名---- " + fileName;
        }
        else {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }
        cmd.Parameters.AddWithValue("FileUpload_FileName", fileName);  //== SqlCommand的參數

        //==== 檔案上傳的程式，寫在這裡 =======================(end)==

        TextBox tb2 = (TextBox)FormView1.FindControl("FileUpload_MemoTextBox");
        cmd.Parameters.AddWithValue("FileUpload_Memo", tb2.Text);

        TextBox tb3 = (TextBox)FormView1.FindControl("FileUpload_UserTextBox");
        cmd.Parameters.AddWithValue("FileUpload_User", tb3.Text);
        //********************************************(end)


        //== (3). 自由發揮。把撈出來的紀錄，呈現在畫面上。
        int RecordsAffected = cmd.ExecuteNonQuery();
        Label1.Text += "<br />執行 Insert Into的 SQL指令以後，影響了" + RecordsAffected + "列的紀錄。";

        //== (4). 釋放資源、關閉資料庫的連結。
        cmd.Cancel();
        //---- Close the connection when done with it.
        if (Conn.State == ConnectionState.Open)  {
            Conn.Close();
            Conn.Dispose();
        }

        //===============================================================
        //== 資料新增成功以後 ....（跟上一個範例略有不同）
        FormView1.ChangeMode(FormViewMode.ReadOnly);
        //===============================================================


        //== 自己寫程式，做 DataBinding ======================(start)

        SqlConnection Conn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM [FileUpload_DB] Order By FileUpload_DB_id DESC", Conn1);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            Conn1.Open();   //---- 這時候才連結DB
            dr = cmd1.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

            FormView1.DataSource = dr;
            FormView1.DataBind();
        }
        catch(Exception ex1)  //---- 如果程式有錯誤或是例外狀況，將執行這一段
        {   //---- http://www.dotblogs.com.tw/billchung/archive/2009/03/31/7779.aspx
            Response.Write("<b>Error Message----  </b>" + ex1.ToString() + "<hr />");
        }
        finally
        {
            //---- Always call Close when done reading.
            if (dr != null)  {
                cmd1.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                dr.Close();
            }
            //---- Close the connection when done with it.
            if (Conn.State == ConnectionState.Open) {
                Conn.Close();
                Conn.Dispose();
            }
        }
        //== 自己寫程式，做 DataBinding ======================(end)


        Label1.Text += "<h2>檔案上傳、新增一筆記錄，成功！！</h2>";
    }
}