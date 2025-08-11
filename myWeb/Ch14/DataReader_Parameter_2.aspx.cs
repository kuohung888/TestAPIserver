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


public partial class _Book_New_Samples_DB_DataReader_Default_1_DataReader_Parameter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select id,test_time,summary,author from test where id = @id", Conn);
        
        if (IsNumeric(Request["id"]))  {
            //== 參數！！ ============================(start)
            cmd.Parameters.Clear();
            List<SqlParameter> paralist = new List<SqlParameter>();
            paralist.Add(new SqlParameter("@id", Convert.ToInt32(Request["id"])));

            //--第一種寫法------------------------------------------------
            // 資料來源 http://stackoverflow.com/questions/11518377/how-do-i-use-mysqlparametercollection-addrange
            //paralist.Add(new SqlParameter("@p1", value1));    //如果要加入多個參數，怎麼辦？？
            //paralist.Add(new SqlParameter("@p2", value2));
            cmd.Parameters.AddRange(paralist.ToArray<SqlParameter>());  // 把「陣列」值，批次加入參數裡面
            // http://blog.xuite.net/linriva/blog/38518331-%5BASP.NET%5D+SqlParameter+%3A+%E9%99%A3%E5%88%97%E5%AE%A3%E5%91%8A

            ////--第二種寫法------------------------------------------------
            //cmd.Parameters.AddRange(new SqlParameter[]
            //{
            //    new SqlParameter("@p1", value1),
            //    new SqlParameter("@p2", value2)
            //});

            ////--第三種寫法------------------------------------------------
            //SqlParameterCollection parameterCollection = cmd.Parameters;
            //foreach (SqlParameter para in paralist)   {
            //    parameterCollection.Add(para);
            //}            

            //**** 有時method裡,引數數量並不是固定的,就可以用params來宣告 ****
            // http://www.allenkuo.com/EBook5/view.aspx?a=1&TreeNodeID=123&id=603
            //== 參數！！ ============================(end)
        }
        else  {
            Response.Write("<h2>URL網址傳來的 id 並非數字！</h2>");
            return;
        }         

        try   {  
            Conn.Open();   //== 第一，連結資料庫。
            dr = cmd.ExecuteReader();    //== 第二，執行SQL指令，取出資料

            GridView1.DataSource = dr;   //==第三，自由發揮，把執行後的結果呈現到畫面上。
            GridView1.DataBind();    //--資料繫結
        }
        catch (Exception ex)  {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            //---- http://www.dotblogs.com.tw/billchung/archive/2009/03/31/7779.aspx
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally  {
            // == 第四，釋放資源、關閉資料庫的連結。
            if (dr != null)  {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                dr.Close();
            }
            if (Conn.State == ConnectionState.Open)  {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

    }




    // C#的 IsNumeric Function
    //資料來源：http://www.died.tw/2009/04/aspnet-c-isnumber.html
    static bool IsNumeric(object Expression)
    {
        bool isNum;
        double retNum;
        isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
        return isNum;
    } 
}