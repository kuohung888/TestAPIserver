using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//*******************************************************
public delegate void aaa(object sender, int newPageIndex);

public partial class ucPager : System.Web.UI.UserControl
{
	public event aaa pageIndexChanged;


	protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (pageIndexChanged == null) return;

		int newPageIndex;
		int.TryParse(DropDownList1.SelectedValue, out newPageIndex);
		pageIndexChanged(this, newPageIndex);
	}

	protected void Button_Command(object sender, CommandEventArgs e)
	{
		if (pageIndexChanged == null) return;

		int newPageIndex;
		int.TryParse(e.CommandArgument.ToString(), out newPageIndex);
		pageIndexChanged(this, newPageIndex);
	}
}