using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch03_WebControls_TextBox_Calculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int sum = Convert.ToInt32(TextBox1.Text) + Convert.ToInt32(TextBox2.Text) + Convert.ToInt32(TextBox3.Text);

        Label1.Text = String.Format("{0:C}", sum);
        //--轉換成貨幣格式
        //也可以寫成這樣 -- Label1.Text = String.Format("{0:NT$ #,### ; -NT$ #,###}", sum);
    }
}
