using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch04_Validator_V_7_01_Mod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Label1.Text = "Button1_Click事件提供的訊息：Page is valid.";
        }
        else
        {
            Label1.Text = "Button1_Click事件提供的訊息：Page is not valid !";
        }
    }


    //== 使用者自訂驗證 ==
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            // Test whether the value entered into the text box is even.
            int i = int.Parse(args.Value);   //==轉成整數型態。
            args.IsValid = ((i % 2) == 0);   //==除以二的「餘數」為零，則是偶數！
        }

        catch (Exception ex)
        {
            args.IsValid = false;
            Response.Write("例外狀況 -- " + ex.ToString() + "<br />");
        }

    }
}