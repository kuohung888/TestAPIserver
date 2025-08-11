using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch04_Validator_V_7_Email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Label1.Text = args.Value;

        String[] emailparts;  // 字串陣列
        String user;
        String provider;

        emailparts = args.Value.Split("@".ToCharArray(), 2);
        //註解：把使用者輸入的 E-Mail字串（args.Value），依 ＠符號分成前後兩段。
        //     @符號之前的，稱為 user。 @符號之後的，稱為 provider。

        if (emailparts.Length == 2) 
        {
            user = emailparts[0].ToString();
            provider = emailparts[1].ToString();
        }
        else
        {
            // 找不到＠符號，這不是有效的E-Mail格式
            user = String.Empty;
            provider = String.Empty;

            args.IsValid = false;   // 註解：出現「驗證錯誤」訊息！
        }

   }
}