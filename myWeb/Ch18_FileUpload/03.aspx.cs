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

public partial class Ch18_FileUpload_3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String savePath = "D:\\temp\\uploads\\";
        //      或是寫成  String savePath = @"d:\temp\uploads\";

        if (FileUpload1.HasFile) 
        {
            //註解：取得上傳檔案的大小
            int fileSize = FileUpload1.PostedFile.ContentLength;

            //註解：上傳的檔案，必須小於0.5MB
            if (fileSize < 500000)  {
                savePath = savePath + FileUpload1.FileName;

                FileUpload1.SaveAs(savePath);
                Label1.Text = "檔案上傳成功";
            }
            else  {
                Label1.Text = "上傳的檔案，必須小於0.5MB 。您要上傳的檔案，容量是---" + fileSize.ToString() + " Bytes";
            }
        }
        else  {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }
    }
}
