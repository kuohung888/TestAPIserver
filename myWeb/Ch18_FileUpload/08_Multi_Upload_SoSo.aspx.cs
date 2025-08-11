using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_8_Multi_Upload_SoSo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //--註解：網站上的目錄路徑。所以不寫磁碟名稱（不寫 “實體”路徑）。
        string saveDir = "\\Book_Sample\\Ch18_FileUpload\\Uploads\\";
        string appPath = Request.PhysicalApplicationPath;

        string tempfileName = "";
        System.Text.StringBuilder myLabel = new System.Text.StringBuilder();
        //如果事先宣告 using System.Text;
        //便可改寫成 StringBuilder myLabel = new StringBuilder();


        //===========================================
        //==市面上很多書都會教你這樣寫。這樣不是錯。
        //==但有更棒的方法可以改善!!
        //===========================================

        //== 使用者種方法，您有幾個 FileUpload控制項
        //== 就要寫幾次 if判別式

            if (FileUpload1.HasFile)
            {
                string fileName = FileUpload1.FileName;
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
                    Label1.Text = Label1.Text + "<br>抱歉，您上傳的檔名發生衝突，檔名修改如下---- " + fileName;

                }
                //-- 完成檔案上傳的動作。
                string savePath = appPath + saveDir + fileName;
                FileUpload1.SaveAs(savePath);
                //===========================================(End)
                myLabel.Append("<br>檔名---- " + fileName);
            }


            //== 使用者種方法，您有幾個 FileUpload控制項
            //== 就要寫幾次 If判別式

            if (FileUpload2.HasFile)
            {
                string fileName = FileUpload2.FileName;
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
                    Label2.Text = Label1.Text + "<br>抱歉，您上傳的檔名發生衝突，檔名修改如下---- " + fileName;

                }
                //-- 完成檔案上傳的動作。
                string savePath = appPath + saveDir + fileName;
                FileUpload2.SaveAs(savePath);
                //===========================================(End)
                myLabel.Append("<br>檔名---- " + fileName);
            }

        Label3.Text = "上傳成功<hr>" + myLabel.ToString();
    }
}