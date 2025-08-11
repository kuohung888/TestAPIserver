using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch18_FileUpload_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //本範例資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.postedfile.aspx

    protected void Button1_Click(object sender, EventArgs e)
    {
        //註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        String savePath = "d:\\temp\\uploads\\";
        //      或是寫成  String savePath = @"d:\temp\uploads\";

        if (FileUpload1.HasFile)  {
            String fileName = FileUpload1.FileName;  //-- User上傳的完整檔名（不包含 Client端的路徑！）

            savePath = savePath + fileName;

            FileUpload1.SaveAs(savePath);
            Label1.Text = "上傳成功，檔名---- " + fileName;

            My_FileContent(FileUpload1.PostedFile);   //--本範例新增的功能--
        }
        else  {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }
    }


    protected void My_FileContent(HttpPostedFile file)
    {
        int fileLen = 0;        

        // 註解：要上傳的檔案大小
        fileLen = FileUpload1.PostedFile.ContentLength;
        Label2.Text = "檔案大小： " + fileLen.ToString() + " Bytes.";

        // 註解：先宣告一個「位元組陣列」（Byte Array）用來存放檔案內容。此陣列的大小，就是檔案容量的大小。
        Byte[] Input = new Byte[fileLen];

        // 註解：透過 stream來讀取上傳的檔案。
        System.IO.Stream myStream;
        myStream = FileUpload1.FileContent;

        // 註解：讀取檔案，並放入這個陣列。從陣列的「零」開始，一一讀取。
        myStream.Read(Input, 0, fileLen);

        // 註解：把陣列內容，轉換成字串。
        String FileContentString = "";

        for (int i = 0; i < fileLen; i++)
        {
            FileContentString = FileContentString + Input[i].ToString();
        }

        TextBox1.Text = FileContentString;
    }
}
