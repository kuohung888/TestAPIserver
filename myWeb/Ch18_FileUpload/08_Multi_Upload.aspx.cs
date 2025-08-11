using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch18_FileUpload_8_Multi_Upload : System.Web.UI.Page
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

        string pathToCheck = null;
        System.Text.StringBuilder SB = new System.Text.StringBuilder();
        //如果事先宣告 using System.Text;
        //便可改寫成 StringBuilder SB = new StringBuilder();

        for(int i = 1; i <= Request.Files.Count;i++)
        {
            //***************************************************************
            FileUpload myFL = (FileUpload)Page.Form.FindControl("FileUpload" + i);
            //***************************************************************

            if (myFL.HasFile)  
            {
                string fileName = myFL.FileName; 
                pathToCheck = appPath + saveDir + fileName;

                //*** 完成檔案上傳的動作。***
                myFL.SaveAs(pathToCheck);

                SB.Append("<br />目錄與檔名---- " + pathToCheck);
                Label1.Text = SB.ToString();
            }
            else            {
                Label1.Text = "請先挑選檔案之後，再來上傳";
            }
        }  //-- for loop (end)
    }
}
