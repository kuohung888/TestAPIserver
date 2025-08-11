using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;     //==別忘了寫喔！==

public partial class Ch17_File_File_3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using(StreamReader sr  = new StreamReader("C:\\MIS2000Lab_TestFile2.txt"))
        {
            string my_line;

            do  //註解： do...while迴圈
            {    //先執行第一次，然後依照 while的條件，看看要不繼續做下去？
                my_line = sr.ReadLine();        //--註解：一次讀取一行。
                Response.Write("<font color=red>" + my_line + "</font><br>");
            } while (my_line != null);

            sr.Close();
        }
    }
}
