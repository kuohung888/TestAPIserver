using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TextBox_Next_Focus_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<h3>謝謝您按下Button1</h3>");
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        // 為了避免重複寫多個 TextBox的 TextChanged事件，而內容幾乎一樣，所以改成這樣。
        // 不然的話，您會用下面「冗長、重複」的程式來代替這一段。

        TextBox TB = (TextBox)sender;
        if(TB.UniqueID.Length == 8)
        {
            String ID_no = TB.UniqueID.Substring(7, 1);
            // 抓取 TextBox ID最後的流水號，例如 TextBox「1」

            TextBox TBnext = (TextBox)Page.Form.FindControl("TextBox" + (Convert.ToInt32(ID_no) + 1).ToString());
            //上集 第十八章的範例有提到，多重檔案、批次上傳。
            TBnext.Focus(); 
        }  
    }
////************************************************************************
////****  冗長、重複的程式碼  ****
////************************************************************************
//    protected void TextBox1_TextChanged(object sender, EventArgs e)
//    {
//        TextBox2.Focus();
//    }
//    protected void TextBox2_TextChanged(object sender, EventArgs e)
//    {
//        TextBox3.Focus();
//    }
//    protected void TextBox3_TextChanged(object sender, EventArgs e)
//    {
//        TextBox4.Focus();
//    }
//    protected void TextBox4_TextChanged(object sender, EventArgs e)
//    {
//        TextBox5.Focus();
//    }
}