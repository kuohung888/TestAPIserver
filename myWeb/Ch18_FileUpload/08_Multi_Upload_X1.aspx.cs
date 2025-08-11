using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_08_Multi_Upload_X1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 兩種作法，任選其一 ===================================

        //== 方法一。 ==========================================
        //BatchFileUpload(FileUpload1);  //==自己寫的function
        //BatchFileUpload(FileUpload2);
        //BatchFileUpload(FileUpload3);
        //BatchFileUpload(FileUpload4);
        //BatchFileUpload(FileUpload5);

        //== 方法二。改寫如下 =====================================
        for (int i = 1; i <= Request.Files.Count; i++)
        {
            //***************************************************************
            FileUpload myFL = (FileUpload)Page.Form.FindControl("FileUpload" + i);
            //***************************************************************

            BatchFileUpload(myFL);  //==自己寫的function
        }
    }


    //***********************************************************
    protected void BatchFileUpload(FileUpload myFL)
    {
        //-- 註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        //       C#語法在撰寫磁碟的目錄位置時，請留意以下的寫法：
        String savePath = "d:\\temp\\uploads\\";

        if (myFL.HasFile)
        {
            String fileName = myFL.FileName;

            savePath = savePath + fileName;
            myFL.SaveAs(savePath);

            Label1.Text += "<br />上傳成功，檔名---- " + fileName;
        }

    }


}