using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_8_Multi_Upload_Show : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //--註解：網站上的目錄路徑。所以不寫磁碟名稱（不寫 “實體”路徑）。
        //--以下的 URL路徑，請依照實際狀況，進行修改。否則程式會報錯！
        string saveDir = "\\Book_Sample\\Ch18_FileUpload\\Uploads\\";
        string appPath = Request.PhysicalApplicationPath;
        //-- appPath是網站 "根"目錄「轉換成」Server端硬碟路徑。

        string tempfileName = "";
        System.Text.StringBuilder myLabel = new System.Text.StringBuilder();
        //如果事先宣告 using System.Text;
        //便可改寫成 StringBuilder myLabel = new StringBuilder();

        for (int i = 1; i <= Request.Files.Count; i++)
        {
            FileUpload myFL =  (FileUpload)Page.Form.FindControl("FileUpload" + i);

            //*** 新增加的程式碼 for Image控制項（展現上傳後的圖片） ***
            Image myImg =  (Image)Page.Form.FindControl("Image" + i);

            if (myFL.HasFile)
            {
                string fileName = myFL.FileName;   //-- User上傳的檔名（不包含 Client端的路徑！）
                string pathToCheck = appPath + saveDir + fileName;

                //===========================================(Start)
                if (System.IO.File.Exists(pathToCheck))
                {
                    int my_counter = 2;
                    while (System.IO.File.Exists(pathToCheck))
                    {
                        //--檔名相同的話，目前上傳的檔名（改成 tempfileName），
                        //  前面會用數字來代替。
                        tempfileName = my_counter.ToString() + "_" + fileName;
                        pathToCheck = appPath + saveDir + tempfileName;
                        my_counter = my_counter + 1;
                    }
                    fileName = tempfileName;
                    Label1.Text = Label1.Text + "<br />抱歉，您上傳的檔名發生衝突，檔名修改如下---- " + fileName;

                }
                //-- 完成檔案上傳的動作。
                string savePath = appPath + saveDir + fileName;
                myFL.SaveAs(savePath);
                //===========================================(End)
                myLabel.Append("<br />檔名---- " + fileName);


                //***********************************************
                //***  上傳後，立即展示圖片  ********************
                myImg.Visible = true;
                //--以下的路徑，請依照實際狀況，進行修改。否則程式會報錯！
                myImg.ImageUrl = "http://localhost:8080/MIS2000Lab_Csharp/Book_Sample/Ch18_FileUpload/Uploads/" + fileName;
                //*** 請注意這裡的斜線（/），因為是字串，而不是目錄的路徑，所以不需要寫成「 //」。
                //***********************************************
            }
        }   //-- for loop (end)

        Label2.Text = "上傳成功<hr />" + myLabel.ToString();
    }
}