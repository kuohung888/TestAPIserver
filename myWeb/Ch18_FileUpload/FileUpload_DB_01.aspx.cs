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


public partial class Book_Sample_Ch18_FileUpload_FileUpload_DB_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {   //參考資料：http://msdn.microsoft.com/zh-tw/library/ms227669.aspx

        if (IsPostBack)
        {
            string path = Server.MapPath("~/Book_Sample/Ch18_FileUpload/Uploads/");   //-- 網站的URL路徑。
            string filename = FileUpload1.FileName;
            Boolean fileOK = false;

            if (FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(filename).ToLower();

                //-- 註解：用「字串陣列」來存放允許上傳的副檔名。
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }

                //--------------------------------------------------------------------------------------------------
                if (fileOK)
                {
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                        // Label1.Text = "上傳成功!";
                        Label1.Text += "<hr />Server端的存檔「路徑」：" + path;
                        Label1.Text += "<br />檔名：" + FileUpload1.FileName;  

                        //=======================================
                        //== 把上傳的「檔名」寫入 FileUpload_DB資料表
                        int i = FileUpload_DB(FileUpload1.FileName);

                        if (i > 0)
                        {
                            Label1.Text += "上傳成功!";
                        }
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "發生例外錯誤，上傳失敗！";
                        throw ex;
                    }
                }
                else
                {
                    Label1.Text = "上傳的檔案，副檔名只能是 .jpg, .jpeg, .png, .gif 這四種。";
                }

            }
        }

    }


    protected int FileUpload_DB(String InputFileName)
    {
        //=======微軟SDK文件的範本=======
        //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
        //----連結資料庫----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Insert Into FileUpload_DB(FileUpload_time, FileUpload_FileName, FileUpload_Memo) Values(getdate(), '" + InputFileName + "', '上傳圖檔的註解與說明文字')", Conn);
        int i = 0;

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            //== 第一，連結資料庫。
            Conn.Open();   //---- 這時候才連結DB

            //== 第二，執行SQL指令。            
           i = cmd.ExecuteNonQuery();

            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            
        }
        catch (Exception ex)
        {  //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
            throw ex;
        }
        finally
        {
            // == 第四，釋放資源、關閉資料庫的連結。
                cmd.Cancel();
            //---- Close the connection when done with it.
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }
        return i;  //-- 傳回值。
    }
}