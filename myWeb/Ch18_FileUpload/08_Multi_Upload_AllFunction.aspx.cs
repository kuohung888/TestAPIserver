using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_8_Multi_Upload_AllFunction : System.Web.UI.Page
{

    //============================================
    //--註解：網站上的目錄路徑。所以不寫磁碟名稱（不寫 “實體”路徑）。
    //--以下的 URL路徑，請依照實際狀況，進行修改。否則程式會報錯！
    String saveDir = "\\Ch18_FileUpload\\Uploads\\";
    System.Text.StringBuilder myLabel = new System.Text.StringBuilder();
    //============================================


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        String appPath = Request.PhysicalApplicationPath;   //-- 把URL路徑，轉成 Server上面的硬碟 [實體]路徑。
        //-- appPath是網站 "根"目錄「轉換成」Server端硬碟路徑。

        for(int i = 1; i <= Request.Files.Count;i++)
        {
            FileUpload myFL  = (FileUpload)Page.FindControl("FileUpload" + i) ;
            Image myImg= (Image)Page.Form.FindControl("Image" + i);    //--上傳後，圖片展示。
            myImg.ImageUrl = "";
            myImg.Visible = false;

            if (myFL.HasFile) 
            {
                String fileName = myFL.FileName;    //-- User上傳的完整檔名（不包含 Client端的路徑！）
                String pathName = appPath + saveDir;
                //========================================(Start)

                if (CheckFileName_Extension(fileName))    //==自訂的函數，檢查上傳的副檔名是否符合我們的要求（只能上傳圖檔）？
                {
                    String NewPathAndFilename = CheckFileName(pathName, fileName);   //==自訂的副程式，檢查上傳的檔名是否重複？
                    //-- 檔名若重複，修正以後傳回「新的檔名」。

                    // == 完成檔案上傳的動作。==
                    myFL.SaveAs(NewPathAndFilename);

                    myLabel.Append(NewPathAndFilename + "<hr />上傳成功");

                    //***  上傳後，立即展示圖片  ********************
                    myImg.Visible = true;
                    //--以下的路徑，請依照實際狀況，進行修改。否則程式會報錯！
                    myImg.ImageUrl = "~/Ch18_FileUpload/Uploads/" + fileName;
                    //***********************************************         
                }
                else
                {
                    myLabel.Append("<br />上傳的檔案，副檔名只能是 .jpg, .jpeg, .png, .gif ...等等圖檔。");
                }
                //========================================(End)
            }
            else
            {
                myLabel.Append("請先挑選檔案之後，再來上傳");
            }
        }   // for迴圈的結尾（end）
        Label2.Text = myLabel.ToString();        
    }


    //==============================================
    //==自訂的函數，檢查上傳的副檔名是否符合我們的要求（只能上傳圖檔）？
    protected Boolean CheckFileName_Extension(String fileName)
    {
        String fileExtension = System.IO.Path.GetExtension(fileName).ToLower();
        //--使用到 System.IO命名空間，可以檢查「副檔名」。

        Boolean result = false;
        //-- 註解：用「字串陣列」來存放允許上傳的副檔名。
        string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tif" };

        for (int i = 0; i < allowedExtensions.Length; i++)
        {
            if (fileExtension == allowedExtensions[i])
                result = true;   //--上傳的副檔名，符合我們的要求。
        }
        return result;
    }


    //=============================================
    //==自訂的副程式，檢查上傳的檔名是否重複？
    protected String CheckFileName(String OldPath, String OldFilename)
    {
        String PathAndFilename = OldPath + OldFilename;

        if (!System.IO.File.Exists(PathAndFilename))
            return PathAndFilename;  //-- 檔名不重複，可沿用原本的 Server路徑與檔名。
        //--------------------------------------

        //-- 檔名重複，則要修改檔名，並傳回新的路徑與檔名。檔名。
        int my_counter = 2;
        String tempfileName = null;
        while (System.IO.File.Exists(PathAndFilename))
        {
                //-- 檔名相同的話，目前上傳的檔名（改成 tempfileName），[前面]會用數字來代替。
                tempfileName = my_counter.ToString() + "_" + OldFilename;  //-- 用新檔名，取代重複的檔名！
                PathAndFilename = OldPath + tempfileName;    //-- appPath是網站 "根"目錄「轉換成」Server端硬碟路徑
                my_counter = my_counter + 1;
        }
        Label1.Text += "<br />抱歉，您上傳的檔名發生衝突，檔名修改--- " + tempfileName;

        return PathAndFilename;  //-- 回傳路徑 + 新的檔名！
    }


}