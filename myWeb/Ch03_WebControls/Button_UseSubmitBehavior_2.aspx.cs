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

public partial class Ch03_WebControls_Button_UseSubmitBehavior_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("您剛剛輸入的字----  " + TextBox1.Text);

        Button1.Text = "資料處理中....請稍後！";
        Button1.Enabled = false;
        // 按下按鈕送出（Submit）後，按鈕就會反白無法使用
    }
}
