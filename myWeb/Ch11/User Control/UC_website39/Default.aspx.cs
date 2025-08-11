using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		ucA1.Command += ucA1_Command;
        // 幫ucA1使用者控制項的 OnCommand，加上ucA1_Command事件。
    }

	void ucA1_Command(object sender, CommandEventArgs e)
	{
		Response.Write("ucA1觸發Command事件 , CommandName=" + e.CommandName);
	}
}