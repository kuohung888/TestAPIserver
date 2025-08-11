using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //-- 正規運算式（Regular Expression）
        string pattern = @"\b(\w+?)\s\1\b";

        //-- 資料來源
        string input = "This this is a nice day. What about this? This tastes good. I saw a a dog.";

        //-- RegexOptions.IgnoreCase。不區分大小寫
        //-- 將規則運算式選項設定為 RegexOptions.IgnoreCase 來呼叫 Regex.Matches() 方法
        //-- Regex.Matches() 方法。傳回所有成功的相符項目。（http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.matches.aspx ）。
        
        foreach (Match match in Regex.Matches(input, pattern, RegexOptions.IgnoreCase))
            Label1.Text += String.Format("{0} (duplicates '{1})' at position {2}",
                              match.Value, match.Groups[1].Value, match.Index) + "<br />";
    }
}