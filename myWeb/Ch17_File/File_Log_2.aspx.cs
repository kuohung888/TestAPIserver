using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


//----自己寫的----
using System;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
//----自己寫的----

public partial class Ch17_File_File_Log_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //----上面已經事先寫好 Imports System.Web.Configuration ----
        //----連結資料庫----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand("select id,test_time,summary,author from test where id =999999", Conn);
        //故意寫錯SQL指令，找不到資料。才會出現 .err的錯誤LOG檔案

        try
        {
            Conn.Open();   //---- 這時候才連結DB
            My_Log("第一、連結資料庫，Conn.Open()", "log");

            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料
            if (dr.HasRows)  {
                My_Log("執行SQL指令", "log");
            }
            else  {
                My_Log("執行SQL指令，卻沒有任何資料！", "err");
            }

            GridView1.DataSource = dr;
            GridView1.DataBind();
            My_Log("第三、資料繫結", "log");

            cmd.Cancel();
            dr.Close();
            My_Log("第四、關閉資源，cmd與dr", "log");

            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose();   //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
                My_Log("      關閉資料庫的連結，Conn.Close()", "log");
            }
        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            My_Log("例外狀況 Exception--" + ex.ToString(), "err");
        }
    }

    //**************************************************************************
    //***  Log記錄過程，獨立寫成一個副程式，名為 My_Log()。
    //***  因為這個副程式，將會接收別人傳來「訊息」與「.log或.err副檔名」並且做紀錄，
    //***  所以這個My_Log()副程式必須有兩個輸入值。
    //**************************************************************************
    protected void My_Log(string my_LogMsg, string my_LogName)
    {
        string myLog_FileName = System.DateTime.Now.ToString("yyyyMMdd");
        //-- 以日期當作檔名，一天記錄一個檔案。
        try
        {
            string my_Dir = "c:\\MIS2000Lab_ASP.NET_Log\\" + System.DateTime.Now.ToString("yyyyMMdd") + "\\";
            //--另一種作法，會把「年」「月」「日」各自建立一個目錄
            //string my_Dir = "c:\\MIS2000Lab_ASP.NET_Log\\" + System.DateTime.Now.ToShortDateString() + "\\";

            if (!Directory.Exists(my_Dir))
            {
                Directory.CreateDirectory(my_Dir);  //--如果這目錄不存在，就建立它。
            }
            string strRecord = System.String.Format("[{0:yyyy/MM/dd hh:mm:ss}]Message : {1}", System.DateTime.Now, my_LogMsg.Trim());

            string LogFile = my_Dir + "\\" + myLog_FileName + "." + my_LogName;   
            //--紀錄檔的副檔名(my_LogName)是 .log or .err

            StreamWriter sw = new StreamWriter(LogFile, true, System.Text.Encoding.GetEncoding("BIG5"));
            //--第一個參數，檔名。
            //--第二個參數，是否採用APPEND的方式？表示新的資料，會附加在檔案末端。
            //--第三個參數，正體中文編碼 System.Text.Encoding.GetEncoding("BIG5")，預設值UTF-8。
            sw.WriteLine(strRecord);

            sw.Flush();
            sw.Close();
            sw.Dispose();
        }
        catch (Exception exLOG)
        {
            Response.Write(exLOG.Message.ToString());
        }
    }
    //**************************************************************************

}
