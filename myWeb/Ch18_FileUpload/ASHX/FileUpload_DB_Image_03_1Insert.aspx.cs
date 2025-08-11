using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----


public partial class Book_Sample_Ch18_FileUpload_ASHX_FileUpload_DB_Image_03_1Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- 註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        //       C#語法在撰寫磁碟的目錄位置時，請留意以下的寫法：
        String savePath = "d:\\temp\\uploads\\";
        String fileName = null;

        if (FileUpload1.HasFile)
        {
            fileName = FileUpload1.FileName;

            savePath = savePath + fileName;
            FileUpload1.SaveAs(savePath);

            Label1.Text = "上傳成功，檔名---- " + fileName;
        }
        else
        {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }

        //********************************************* (start)***
        //== (1). 開啟資料庫的連結。
        //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
        //----或是寫成下面這一行 (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();   //---- 這時候才連結DB


        //== (2). 執行SQL指令。或是查詢、撈取資料。
        String sqlstr = "Insert Into FileUpload_DB3(FileUpload_time, FileUpload_FileName)";
        sqlstr += "    Select getdate(), xyz.*  From OPENROWSET(Bulk 'd:\\temp\\uploads\\" + fileName + "', Single_Blob) xyz";  //必須給資料集別名
        // OPENROWSET使用的最後一個參數， Single_Blob代表二進位
        // -- http://msdn.microsoft.com/zh-tw/library/ms190312.aspx

        SqlCommand cmd = new SqlCommand(sqlstr, Conn);

        //== (3). 自由發揮。
        cmd.ExecuteNonQuery();
        //== (4). 釋放資源、關閉資料庫的連結。
        cmd.Cancel();
        if (Conn.State == ConnectionState.Open)
        {
            Conn.Close();
            Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
        }
        //********************************************* (end) ***


    }
}