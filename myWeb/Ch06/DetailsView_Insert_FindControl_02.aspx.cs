using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch06_DetailsView_Insert_FindControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        TextBox TB = (TextBox)FormView1.FindControl("titleTextBox");
        TextBox TB_old = (TextBox)DetailsView1.FindControl("TextBox1");  
        // DetailsView裡面的「會員名稱（real_name）」

        TB.Text = TB_old.Text;
    }


    protected void SqlDataSource2_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //FormView的新增功能，先暫停（不運作）。
        Response.End();
    }
}