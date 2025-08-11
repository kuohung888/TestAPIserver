using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的----


public partial class Ch14_Default_1_NextResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 上面已經事先寫好NameSpace --  Using System.Web.Configuration; ----     
        // 或是寫成下面這一行 (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        Conn.Open();
        
        //==第二，設定並執行SQL指令
        // 執行 “兩行” SQL指令，第一個SQL指令最後加上分號（;）
        SqlCommand cmd  = new SqlCommand("SELECT id,title FROM test;  SELECT id,author FROM test_talk", Conn);
        SqlDataReader dr = cmd.ExecuteReader();

        //==第三，自由發揮，將資料呈現在畫面上==
        // 讀取時若還有其他的 Result Set，則DataReader的 .NextResult()方法會傳回 true。
        do 
        {
            Response.Write("<br /><br /><br />");
            Response.Write("第一個SQL指令的結果，欄位名稱：<font color=red>" + dr.GetName(0) + "    " + dr.GetName(1) + "</font>");
            Response.Write("<br />第二個SQL指令的結果");

            while(dr.Read()) 
            {
                  Response.Write("<hr />" + dr[0] + "<br />" + dr[1]);
            }
         } while(dr.NextResult()); 
         // 依序往下讀取另一個 Result Set，直到沒有其他Result Set為止。
         // 若沒有其他的Result Set就讓 dr.NextResult() = false，迴圈便會停止。

        cmd.Cancel();    //==第四，關閉資源＆資料庫的連線==
        dr.Close();
        Conn.Close();
    }
}
