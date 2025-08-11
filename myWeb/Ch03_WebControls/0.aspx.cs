using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_MIS2000Lab_book_image_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.TextMode = TextBoxMode.MultiLine;
        // 改成「多欄」的文字輸入。
        TextBox1.Text = "動態修改後的「值」";

        TextBox1.BackColor = System.Drawing.Color.AliceBlue;
        // 把底色改成水藍色。
    }
}