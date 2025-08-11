using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_CaseStudy_Street_Address_Test_03_Setting_PageLoad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //底下這一列可運作。
            //DropDownList1.Text = "3";   // .Text屬性其實就是  .SelectedValue

            //底下這一列可運作。
            DropDownList1.SelectedValue = "3";
            //***下面寫法會錯！只能用 .SelectedValue
            //DropDownList1.SelectedItem.Text = "高雄市";

            DropDownList2.SelectedValue = "12";
        }
    }
}