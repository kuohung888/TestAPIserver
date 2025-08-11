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

public partial class Ch03_WebControls_6_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //註解：輸入在TextBox控制項裡面的文字，就會新增為下拉式選單的子選項！
        DropDownList1.Items.Add(TextBox1.Text);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedItem.Text;
        Label2.Text = DropDownList1.SelectedItem.Value;
    }
}
