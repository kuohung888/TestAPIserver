using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch18_FileUpload_9_Multi_Upload_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpPostedFile myFL;   //****重點！！****

        string savePath = "D:\\temp\\uploads\\";

        for(int i = 0; i < Request.Files.Count; i++)   //****重點！！****
        {
            myFL = Request.Files[i];    //-- 抓到第幾個上傳元件了

            if (myFL.ContentLength > 0)   //-- 等同於 FileUpload1.HasFile屬性。有沒有選取上傳檔案？
            {   
                //---- 透過下面的方法，只取出上傳檔案的檔名。 -----重點！！---------------(start)
                string[] StringArray = myFL.FileName.Split('\\');
                // 字串的 .Split()方法。 參考資料 http://msdn.microsoft.com/zh-tw/library/ms228388(VS.80).aspx

                int Array_No = (StringArray.Length - 1);
                string UploadFileName = StringArray[Array_No];
                //--------------------------------------------------------------------------------------------- (end)
                
                //-- 註解：「目錄路徑」與「檔案名稱」，兩者都要！
                myFL.SaveAs(savePath + UploadFileName);   //-- 上傳成功，存檔。

                Response.Write("<br />上傳第" + i + "個檔案");
                Response.Write("<br />上傳檔案的名稱＆路徑-- " + myFL.FileName);
                Response.Write("<br />檔案大小-- " + myFL.ContentLength + "KB");
                Response.Write("<br />檔案型態-- " + myFL.ContentType);
                Response.Write("<hr />");
            }   // if condition
        }   // for loop
    }
}
