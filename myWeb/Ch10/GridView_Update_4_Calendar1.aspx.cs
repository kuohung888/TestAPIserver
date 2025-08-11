using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_4_Calendar : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session["RowIndex"] = e.NewEditIndex;
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        // C#語法不能直接寫.Parent ====================
        String str = ((Control)sender).Parent.ClientID;
        // 資料來源 http://saloster.wordpress.com/2012/06/15/namingcontainer-gridview-templatefield-control/
        
        Response.Write("新的寫法（找出位於GridView第幾列，從零算起。請看最後一個數字）--" + str);
        // 結果會是 -- GridView1_ctl欄位數_列數
        //=====================================

        int rowIndex = Convert.ToInt32(Session["RowIndex"]);

        TextBox TB = (TextBox)GridView1.Rows[rowIndex].FindControl("TextBox1");
        Calendar CA = (Calendar)GridView1.Rows[rowIndex].FindControl("Calendar1");

        TB.Text = CA.SelectedDate.ToShortDateString();
    }

}