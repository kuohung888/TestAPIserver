using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;     //==別忘了寫喔！==


public partial class Ch17_File_File_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (File.Exists("C:\\MIS2000Lab_TestFile2.txt"))
        {
            //--註解：先檢查一下，看看這個檔案是否存在？
            //-- File.Exists()方法不使用於路徑驗證，這個方法僅會檢查「指定的檔案是否存在」。
            Response.Write("<font color=red>*** C:\\MIS2000Lab_TestFile2.txt 檔案的確存在！***</font>");

            return;  //--註解：檔案已經存在，就不會執行下面的寫入動作。
        }

        //如果檔案不存在，就會建立一個檔案
        using(StreamWriter sw = File.CreateText("C:\\MIS2000Lab_TestFile2.txt"))
        {  // Creates or opens a file for writing UTF-8 encoded text. 
            sw.WriteLine("C:\\MIS2000Lab_TestFile2.txt");
            sw.WriteLine("===================");
            sw.WriteLine("寫入一個整數 {0}，然後再寫入一個浮點數 {1}。....完成了，掰掰！", 1, 4.2);

            sw.WriteLine("===================");
            sw.Write("The date is: ");
            sw.WriteLine("{0:yyyy/MM/dd}", DateTime.Now.ToShortDateString());
            sw.Close();

            Response.Write("<font color=blue>*** 已建立 C:\\MIS2000Lab_TestFile2.txt 檔案！***</font>");
        }
    }
}
