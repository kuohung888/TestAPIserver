using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;     //==別忘了寫喔！==


public partial class Ch17_File_File_Dir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DirectoryInfo my_dir = new DirectoryInfo("C:\\");

        FileInfo[] fi_Array = my_dir.GetFiles();    //--註解：陣列
        //  .GetFiles() 從目前的目錄，取回檔案清單。

        Response.Write(my_dir.Name + "<hr>");

        foreach(FileInfo fi in fi_Array)    //--註解：fi 個別的檔案。
        {
            Response.Write("檔案： " + fi.Name);
            Response.Write(" ----大小：" + fi.Length + "<br>");
        }
    }
}
