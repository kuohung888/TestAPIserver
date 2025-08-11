using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //-- 正規運算式（Regular Expression）
        string pattern = "(Mr\\.? |Mrs\\.? |Miss |Ms\\.? )";

        //-- 資料來源（放在陣列裡面）
        string[] names = { "Mr. Henry Hunt", "Ms. Sara Samuels", "Abraham Adams", "Ms. Nicole Norris" };

        foreach (string name in names)
            //-- 將符合的字串取代為 String.Empty，也就是說，會從原始字串中移除符合的字串。 
            Label1.Text += Regex.Replace(name, pattern, String.Empty) + "<br />";

    }
}