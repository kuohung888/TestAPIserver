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

public partial class Ch03_WebControls_10_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDates[0].ToShortDateString();
        //  「零」表示：被選定的日期區間，這一段日期的「第一天」。

    }
}
