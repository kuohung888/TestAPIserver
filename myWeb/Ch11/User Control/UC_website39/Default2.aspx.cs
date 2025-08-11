using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		ucPager1.pageIndexChanged += ucPager1_pageIndexChanged;
        // 幫ucPager1使用者控制項的 OnpageIndexChanged，加上ucPager1_pageIndexChanged事件。
    }

	void ucPager1_pageIndexChanged(object sender, int newPageIndex)
	{
		Response.Write("ucPager1想連到的新頁碼是--" + newPageIndex);
	}
}