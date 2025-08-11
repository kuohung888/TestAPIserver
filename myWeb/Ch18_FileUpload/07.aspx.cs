using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {   //參考資料：http://msdn.microsoft.com/zh-tw/library/ms227669.aspx

            String path = Server.MapPath("~/Ch18_FileUpload/Uploads/");   
             //-- 網站上的 URL路徑。 Server.MapPath() 轉換成Web Server電腦上的硬碟「實體」目錄。

            String filename = FileUpload1.FileName;

            Boolean fileOK = false;

            if (FileUpload1.HasFile)
            {   // 想抓到「主檔名」，請寫成 System.IO.Path.GetFileName(fileName);
                // 想抓到「副檔名」，請寫成 System.IO.Path.GetExtension(fileName);
                string fileExtension = System.IO.Path.GetExtension(filename).ToLower();  // .ToLower() 把副檔名全部改成小寫

                //*******************************************************************************
                //-- 資料來源：http://msdn.microsoft.com/zh-tw/library/ms227669%28v=vs.80%29.aspx
                //-- 註解：用「字串陣列」來存放允許上傳的副檔名。
                string[] allowedExtensions = {".jpg", ".jpeg", ".png", ".gif"};

                for (int i = 0; i < allowedExtensions.Length; i++)  {
                    if (allowedExtensions[i] == fileExtension)
                        fileOK = true;
                }    //-- 延伸範例，請看 「密碼強度」 http://www.dotblogs.com.tw/mis2000lab/archive/2012/07/12/password_strength_textbox_autopostback.aspx
                //*******************************************************************************

                if (fileOK)   {
                    try   {
                        FileUpload1.PostedFile.SaveAs(path + filename);
                        //*** 寫成這樣也行！ FileUpload1.SaveAs(path + filename);
                        Label1.Text = "上傳成功!";
                        Label1.Text += "<hr />Server端的存檔「路徑」：" + path;
                        Label1.Text += "<br />檔名：" + filename;
                    }
                    catch (Exception ex)   {
                        Label1.Text = "發生例外錯誤，上傳失敗！...." + ex.ToString();
                    }
                }
                else  {
                    Label1.Text = "上傳的檔案，副檔名只能是 .jpg, .jpeg, .png, .gif 這四種。";
                }    // 第二個判別式 if (fileOK)

            }    // 第一個判別式 if (FileUpload1.HasFile)

    }
}