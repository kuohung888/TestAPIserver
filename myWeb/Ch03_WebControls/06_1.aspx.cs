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

public partial class Ch03_WebControls_6_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //註解：所謂的「SelectedIndexChanged()」事件，就是有人選取了下拉式選單裡面
        //         ，任何一個選項。
        //          就會啟動這個「SelectedIndexChanged()」事件。

        Response.Write("您剛剛選擇了----" + DropDownList1.SelectedItem.Text);
    }
}
