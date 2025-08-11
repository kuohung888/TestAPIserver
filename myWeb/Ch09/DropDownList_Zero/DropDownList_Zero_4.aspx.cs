using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_DropDownList_Zero_DropDownList_Zero_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "==請選擇==")
        {
            DropDownList2.Items.Clear();   // 清空選項
            DropDownList2.DataSourceID = null;   //防呆，避免出錯！
            DropDownList3.Items.Clear();
            DropDownList3.DataSourceID = null;
            Label1.Text = "請勿挑選「==請選擇==」！！此選項無作用！！";
        }
        else
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("==請選擇222==");
            DropDownList2.DataSourceID = "SqlDataSource2";

            DropDownList3.Items.Clear();
            DropDownList3.DataSourceID = null;
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        DropDownList3.Items.Add("==請選擇333==");
        DropDownList3.DataSourceID = "SqlDataSource3";
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedItem.Text + DropDownList2.SelectedItem.Text + DropDownList3.SelectedItem.Text;
    }


}