using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_Width_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        try
        {
            int colWidth  = Convert.ToInt32(Server.HtmlEncode(TextBox1.Text));

            if (colWidth > 0)
            {
                for (int i = 0; i < GridView1.Columns.Count; i++)
                    GridView1.Columns[i].ItemStyle.Width = colWidth;
                    //-- for迴圈，用來讓每一個欄位的寬度都被改變！
            }
        }
        catch            
        {
            Response.Write("<h3><font color=red>An error occurred. 別鬧了！寬度只能輸入「數字」！</font></h3>");
        }
    }
}