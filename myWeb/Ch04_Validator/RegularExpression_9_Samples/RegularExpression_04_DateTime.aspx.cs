using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Globalization;
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_04_DateTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //-- 轉換時，與文化特性無關
        string dateString = DateTime.Today.ToString("d", DateTimeFormatInfo.InvariantInfo);

        string resultString = MDYToDMY(dateString);
        Label1.Text = String.Format("{0} 轉換為 {1}.", dateString, resultString);
    }

    static string MDYToDMY(string input)
    {
        return Regex.Replace(input, "\\b(?<month>\\d{1,2})/(?<day>\\d{1,2})/(?<year>\\d{2,4})\\b",
            "${day}-${month}-${year}");
        //-- Regex.Replace()方法 
        //-- http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.replace.aspx
    }
}