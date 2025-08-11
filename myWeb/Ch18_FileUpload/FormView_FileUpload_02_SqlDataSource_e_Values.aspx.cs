using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_FormView_FileUpload_02_SqlDataSource_e_Values : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //==== 檔案上傳的程式，寫在這裡 ======================(start)==
        FileUpload FL = (FileUpload)FormView1.FindControl("FileUpload1");

        //-- 註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        String savePath = "D:\\temp\\uploads\\";
        String fileName = null;
        if (FL.HasFile)
        {
            fileName = FL.FileName;
            savePath = savePath + fileName;
            FL.SaveAs(savePath);
            Label1.Text = "上傳成功，檔名---- " + fileName;
        }
        else
        {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }

        //***************************************
        e.Values["FileUpload_FileName"] = fileName;
        //***************************************
        //==== 檔案上傳的程式，寫在這裡 =======================(end)==
    }


    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //== 資料新增成功以後 ....
        if (FormView1.CurrentMode == FormViewMode.Insert)
            FormView1.DefaultMode = FormViewMode.ReadOnly;
        
        //== Select指令被我改過，請到 .aspx畫面去看一下。我做了反排序，讓剛剛新增的那一筆，秀到畫面上（給你確定：新增成功！）

        Label1.Text += "<h2>檔案上傳、新增一筆記錄，成功！！</h2>";
    }
}