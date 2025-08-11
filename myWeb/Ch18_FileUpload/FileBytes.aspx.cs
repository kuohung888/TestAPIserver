using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_FileBytes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //--註解：網站上的目錄路徑。所以不寫磁碟名稱（不寫實體路徑）。
        string saveDir = "\\Book_Sample\\Ch18_FileUpload\\Uploads\\";

        //--註解：HttpRequest.PhysicalApplicationPath屬性用於取得
        //            目前執行中的Web Server之根目錄的 "實體"檔案系統路徑。
        string appPath = Request.PhysicalApplicationPath;


        if (FileUpload1.HasFile)
        {
            string savePath = appPath + saveDir + FileUpload1.FileName;

            FileUpload1.SaveAs(savePath);
            UploadStatusLabel.Text = "上傳成功!! <br>" + savePath;

            //--副程式在下面！！
            DisplayFileContents(FileUpload1.PostedFile);
        }
        else
        {
            UploadStatusLabel.Text = "請先挑選檔案之後，再來上傳";
        }
    }




    void DisplayFileContents(HttpPostedFile file)
    {
        //==本範例的資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filebytes.aspx#Y557
        int fileLen;
        string displayString = "";
        
        // 檔案長度
        fileLen = FileUpload1.PostedFile.ContentLength;
        LengthLabel.Text = "檔案大小：  " + fileLen.ToString() + " bytes.";
        
        //=================================
        //==與另外一支程式 FileContent.aspx 最大的不同。
        byte[] input = new byte[fileLen - 1];  //  Bytes陣列。
        input = FileUpload1.FileBytes;
        //=================================

        // 把位元組陣列，變成字串.
        for (int loop1 = 0; loop1 < fileLen; loop1++)
        {
            displayString = displayString + input[loop1].ToString();
        }
        

        ContentsLabel.Text = "The contents of the file as bytes:";

        TextBox TextBox1 = new TextBox();
        TextBox1.ID = "TextBox1";
        TextBox1.TextMode = TextBoxMode.MultiLine;
        TextBox1.Height = Unit.Pixel(300);
        TextBox1.Width = Unit.Pixel(400);
        TextBox1.Text = displayString.ToString();

        // 把上面動態產生的 TextBox動態加入 Placeholder裡面
        PlaceHolder1.Controls.Add(TextBox1);
    }
}