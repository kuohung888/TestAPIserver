using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_Samples_MSDN_02 : System.Web.UI.Page
{

    //**************************************************************
    private MSDN_UC Spinner1;   //** MSDN_UC  這是UC檔案的「Class名稱」
    //**************************************************************
    // 範例來源  http://msdn.microsoft.com/zh-tw/library/c0az2h86(v=vs.80).aspx

    protected void Page_Load(object sender, EventArgs e)
    {
        Spinner1 = (MSDN_UC)LoadControl("MSDN_UC.ascx");
        // Set MaxValue first.
        Spinner1.MaxValue = 20;
        Spinner1.MinValue = 10;

        PlaceHolder1.Controls.Add(Spinner1);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = Spinner1.CurrentNumber.ToString();
    }
}