using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Delete_MultiRow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        String myMessage = null;

        for (int i = 0; i < GridView1.Rows.Count; i++ )
        {
            CheckBox myCheckbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            Label myID = (Label)GridView1.Rows[i].FindControl("Label1");

            if (myCheckbox.Checked == true)
            {
                //-- 底下這幾行（已經註解掉）會出現錯誤。
                //myMessage = myMessage & GridView1.SelectedDataKey.Value.ToString()
                //myMessage = myMessage & GridView1.SelectedValue.ToString()
                myMessage = myMessage + myID.Text + "，";
            }
        }

        Label2.Text = myMessage;
    }
}