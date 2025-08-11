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

//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的----

public partial class Ch14_Default_1_3_DataReader_Manual_MARS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //----上面已經事先寫好NameSpace --  Using System.Web.Configuration; ----     
        //----或是寫成下面這一行 (連結資料庫)----
        SqlConnection Conn = new SqlConnection("server=localhost; uid=test; pwd=test; database=test;MultipleActiveResultSets=true");

        SqlDataReader dr = null;
        SqlDataReader dr2 = null;

        SqlCommand cmd = new SqlCommand("select id,title from test", Conn);
        SqlCommand cmd2 = null;

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            Conn.Open();   //---- 這時候才連結DB
            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

            if (dr.HasRows )
            {
                while (dr.Read())   //====列出test資料表的每一篇新聞====
                {
                    Response.Write("<p>" + dr["id"] + "  /  <b>" + dr["title"] + "</b></p>");
                    Response.Write("<blockquote><font size=2 color=gray>");

                    //---- 啟動MARS之後（MultipleActiveResultSets=True）。
                    //---- 第一個 DataReader（變數名稱dr）尚未關閉，就直接使用第二個DataReader（變數名稱dr2）。
                    //====列出每一篇新聞的「讀者留言」====
                    cmd2 = new SqlCommand("select test_id,article from test_talk where test_id =" + dr["id"], Conn);
                    dr2 = cmd2.ExecuteReader();
                    if (dr2.HasRows)
                    {
                        while (dr2.Read())
                        {
                            Response.Write("==讀者留言==<br>");
                            Response.Write(dr2["test_id"] + "  /  " + dr2["article"] + "<br>");
                        }
                    }

                    Response.Write("</font></blockquote>");
                }
            }
        }
        catch (Exception ex)
        {  //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
            throw;
        }
        finally
        {   //---- Always call Close when done reading.
            if (dr != null)
            {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                dr.Close();
            }

            //---- Close the connection when done with it.
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

//== 註解： =======================================
//本程式運用到幾個很簡單的HTML碼，稍作說明。
//	<p>…</p> 區分段落
//	<b>…</b> 粗體字
//	<font>…</font> 控制字體的大小、顏色等等。
//	<blockquote>…</blockquote> 段落向內縮排
//	<br /> 換行
//	<hr /> 在畫面上，畫一條水平線。

    }
}
