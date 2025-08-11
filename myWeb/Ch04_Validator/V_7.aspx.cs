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

public partial class Ch04_Validator_V_7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Label1.Text = args.Value;

        if (Convert.ToInt32(args.Value)%2 != 0)
        //註解： %代表除法所得的「餘數」。
        //      除以2而且餘數為0，就是偶數！
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}
