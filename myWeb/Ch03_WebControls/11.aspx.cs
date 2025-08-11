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

public partial class Ch03_WebControls_11 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = new Button();
        Button1.Text = "程式裡頭，動態產生的按鈕";
        PlaceHolder1.Controls.Add(Button1);
        //改成下面這段，畫面會怎樣呢？ 
        //Page.Form.Controls.Add(TextBox1);


        TextBox TextBox1 = new TextBox();
        TextBox1.Text = "程式裡頭，動態產生的文字輸入方塊";
        PlaceHolder1.Controls.Add(TextBox1);
        //改成下面這段，畫面會怎樣呢？ 
        //Page.Form.Controls.Add(TextBox1);

    }
}
