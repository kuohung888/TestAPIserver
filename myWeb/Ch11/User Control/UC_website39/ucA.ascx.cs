using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucA : System.Web.UI.UserControl
{
	public event CommandEventHandler Command;

    
	protected void Button_Command(object sender, CommandEventArgs e)
	{
		if (Command != null) {
			Command(this, e);
		}
	}
}