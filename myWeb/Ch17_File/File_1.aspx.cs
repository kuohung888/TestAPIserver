using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;     //==別忘了寫喔！==


public partial class Ch17_File_File_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //====將文字寫入現有的檔案（TestFile.txt）中====
        using(StreamWriter sw = new StreamWriter("C:\\MIS2000Lab_TestFile.txt"))
        {
            sw.Write("大家好，");
            sw.WriteLine("這是一段測試文字！");
            //--註解： .WriteLine方法會自動換行。

            sw.WriteLine("================");

            sw.Write("The date is: ");
            sw.WriteLine(DateTime.Now);
            //sw.WriteLine(DateTime.Now.ToShortDateString());  
            // .ToShortDateString()會出現短日期，如2008/10/10

            sw.Close();
            Response.Write("<hr>執行成功，請檢查您的硬碟，有無此檔案 --  C:\\MIS2000Lab_TestFile.txt"); 
        }
    }

}
