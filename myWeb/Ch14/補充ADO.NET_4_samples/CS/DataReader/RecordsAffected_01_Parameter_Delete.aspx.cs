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


public partial class _Book_New_Samples_DB_DataReader_RecordsAffected_01_Parameter_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //== (1). 開啟資料庫的連結。
        //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
        //----或是寫成下面這一行 (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();   //---- 這時候才連結DB


        //== (2). 執行SQL指令。或是查詢、撈取資料。
        //********************************************
        //*** 參數版（Parameter）
        SqlCommand cmd = new SqlCommand("Delete From test Where id =@id", Conn);
        cmd.Parameters.AddWithValue("@id", 192);
        //-- 方法一。刪除前，請確認一下 id=192這篇文章在不在？

        //-- 方法二，另一種寫法（v4.5起，已過時）
        //cmd.Parameters.Add("@id", SqlDbType.Int, 4)
        //cmd.Parameters("@id").Value = 192   '-- 刪除前，請確認一下 id=192這篇文章在不在？
        //-- 參考資料 http://msdn.microsoft.com/zh-tw/library/system.data.sqlclient.sqlparametercollection.addwithvalue.aspx
        //********************************************


        //== (3). 自由發揮。
        int RecordsAffected = cmd.ExecuteNonQuery();

        Label1.Text = "執行 Delete的SQL指令以後，影響了" + RecordsAffected + "列的紀錄。";

        //-- 或者是，您可以這樣寫，代表有更動到一些紀錄。
        //if (RecordsAffected > 0)  {
        //    Response.Write("資料刪除成功。共有" + RecordsAffected + "列紀錄被影響。");
        // }

        //== (4). 釋放資源、關閉資料庫的連結。
        cmd.Cancel();

        if (Conn.State == ConnectionState.Open)
        {
            Conn.Close();
            Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
        }

    }
}