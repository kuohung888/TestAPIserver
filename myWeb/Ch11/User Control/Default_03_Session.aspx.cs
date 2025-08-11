using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_User_Control_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 是否分頁？
        mis2000GV.YesOrNo_AllowPaging = Convert.ToBoolean(RadioButtonList1.SelectedValue);

        if (mis2000GV.YesOrNo_AllowPaging == true)
        {
            //== 每一頁呈現的資料筆數？
            Session["NumOfPageSize"] = Convert.ToInt32(DropDownList1.SelectedValue.ToString());

            // mis2000GV.NumOfPageSize = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
            //== 缺點： ==
            //    當您一按下分頁，分頁就會回到「預設值」。每頁七筆記錄。
        }
    }
}