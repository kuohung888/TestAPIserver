using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----

//**************************************
using System.Threading.Tasks;   // Task需要用上。
// 在網站（或專案）按下滑鼠右鍵，在NuGet裡面搜尋「Microsoft.bcl.Async」並且安裝。
//**************************************


public partial class Ch14_Default_1_0_DataReader_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //****請加上 async關鍵字，在事件前方！！***
    protected async void Button1_Click(object sender, EventArgs e)
    {
        await MIS2000Lab_Async();
    }


    //*** 自己寫的 "非同步"函式 ***
    //****請加上 async關鍵字，在函式前方！！***
    protected static async Task  MIS2000Lab_Async()
    {
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select id,test_time,summary,author from test", Conn);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            //== 第一，連結資料庫。非同步的用法只有在.NET 4.5（含）後續新版本
            //舊的寫法  Conn.Open();   //---- 連結DB
            await Conn.OpenAsync();

            //== 第二，執行SQL指令。
            //舊的寫法   dr = cmd.ExecuteReader();   //---- 執行SQL指令，取出資料
            dr = await cmd.ExecuteReaderAsync(CommandBehavior.SequentialAccess);
            //*** CommandBehavior.SequentialAccess ***
            // 提供方法來讓 DataReader 使用大型二進位值來處理含有資料行的資料列。 SequentialAccess 並不會載入整個資料列，而是啟用 DataReader 來載入資料做為資料流。 然後您可以使用 GetBytes 或 GetChars 方法來指定要開始讀取作業的位元組位置和所傳回資料的限制緩衝區大小。
            // 當您指定 SequentialAccess 時，必須以資料行傳回的順序來讀取它們
            // http://msdn.microsoft.com/zh-tw/library/system.data.commandbehavior(v=vs.110).aspx

            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            ////==自己寫迴圈==
            //舊的寫法  while (dr.Read())
            while (await dr.ReadAsync())
            {
                if (await dr.IsDBNullAsync(1))  // 1表示 true，DBNull
                {
                    HttpContext.Current.Response.Write("*** NULL***");
                }
                else
                {
                    HttpContext.Current.Response.Write(dr["author"] + "<br / >");
                }                
            }

        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            HttpContext.Current.Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally
        {   // == 第四，釋放資源、關閉資料庫的連結。
            if (dr != null)
            {   //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                cmd.Cancel();         
                dr.Close();
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose();
            }
        }

    }


}
