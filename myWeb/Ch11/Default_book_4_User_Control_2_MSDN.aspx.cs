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

public partial class Ch11_Default_book_4_User_Control_2_MSDN : System.Web.UI.Page
{

    protected Default_book_4_UserControl_2_MSDN myNewUC;
        
    protected void Page_Load(object sender, EventArgs e)
    {
        myNewUC = 
            (Default_book_4_UserControl_2_MSDN)LoadControl("Default_book_4_UserControl_2_MSDN.ascx");

        Page.Form.Controls.Add(myNewUC);
        //==在Page（網頁）裡面，加入 <MIS2000Lab:GridView2> [使用者控制項，User Control]
    }
}
