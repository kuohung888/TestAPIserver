using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch04_Validator_V_7_Client : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //== Server端也需要作驗證，這樣才安全！！ ==

        //== 重  點！！ ==
        //== (1). 前端的 JavaScript驗證通過，才會進入這裡（後端的驗證）。
        //== (2). 被驗證的「輸入值」，就是 args.Value。

        int input_value = Int32.Parse(args.Value);

        if ((input_value / 2) == 0)
            args.IsValid = true;
        else
            args.IsValid = false;
    }
}