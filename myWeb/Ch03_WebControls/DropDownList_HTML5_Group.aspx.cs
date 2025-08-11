using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_HTML_Web_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			//第一次執行
			String str = "<Select id=SelectID1 name=SelectName1>";
			str += "<optgroup label=AAA>";
			str += "     <Option>111</Option>";
			str += "     <Option>222</Option>";
			str += "</optgroup>";

			str += "<optgroup label=BBB>";
			str += "     <Option>333</Option>";
			str += "     <Option>444</Option>";
			str += "</optgroup>";

			str += "</Select>";

			Literal1.Text = str;
		}
	}

	protected void Button1_Click(object sender, EventArgs e)
	{
		//***  抓不到！！！！ ***
		Response.Write("透過ID來抓 --- " + Request["SelectID1"]);

		Response.Write("<br>透過Name來抓 --- " + Request["SelectName1"]);
	}
}