using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch04_Validator_V_6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Label1.Text = args.Value.ToString();

        if (IsNumeric(args.Value) == false)
        {
            //註解：如果使用者輸入的資料，不是數字型態，
            //           就會出現驗證錯誤訊息！
            args.IsValid = false; 
        }
        else 
        {
            if (Convert.ToInt32(args.Value) < 1000) 
            {
                args.IsValid = false;
                // 註解：如果使用者輸入的數字大於一千，就通過驗證！               
            }
        }
      }


    // IsNumeric Function
    // 資料來源：http://support.microsoft.com/kb/329488/zh-tw
    static bool IsNumeric(object Expression)
    {
        // Variable to collect the Return value of the TryParse method.
        bool isNum;

        // Define variable to collect out parameter of the TryParse method. If the conversion fails, the out parameter is zero.
        double retNum;

        // The TryParse method converts a string in a specified style and culture-specific format to its double-precision floating point number equivalent.
        // The TryParse method does not generate an exception if the conversion fails. If the conversion passes, True is returned. If it does not, False is returned.
        isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
        return isNum;
    }
}
