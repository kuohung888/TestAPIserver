using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_3_DetailsView_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //---------------------------------------------------------------------------------------------------(start)
        //**** 第一種， .FindControl()方法 ****
        Calendar CA = (Calendar)DetailsView1.FindControl("Calendar1");
        TextBox TB = (TextBox)DetailsView1.FindControl("TextBox1");


        //**** 第二種， sender ****        
        //Calendar CA = (Calendar)sender;
        //TextBox TB = (TextBox)DetailsView1.FindControl("TextBox1");


        //**** 第三種， NamingContainer **** 詳見後續程式 GridView_Update_4_Calendar3_INamingContainer.aspx 的說明。       
        //Calendar CA = (Calendar)sender;
        //TextBox TB = (TextBox)CA.FindControl("TextBox1");
        //---------------------------------------------------------------------------------------------------(end)


        //**** 以下就是上集「第三章」Calendar的第一個範例的作法。
        TB.Text = CA.SelectedDate.ToShortDateString();

    }
}