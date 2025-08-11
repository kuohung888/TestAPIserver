using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_05 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string inputString = "My favorite web sites include:</P>" + 
                             "<A HREF=\"http://msdn2.microsoft.com\">MSDN Home Page</A></P>" +
                             "<A HREF=\"http://www.microsoft.com\">Microsoft Corporation Home Page</A></P>" +
                             "<A HREF=\"http://blogs.msdn.com/bclteam\">.NET Base Class Library blog</A></P>";

        Label1.Text = DumpHRefs(inputString);     //-- 自訂的函數
    }

    //=======================================================
    //-- Regex物件 .DumpHRefs()方法由於可能會由使用者程式碼呼叫多次，
    //-- 因此它使用的是 static (在 VB語法中為 Shared) Regex.Match(String, String, RegexOptions) 方法。 
    //-- 這可讓規則運算式引擎快取規則運算式，並避免每次呼叫方法就必須具現化 新 Regex物件的額外負荷。 
    //-- 接著會使用 Match物件來逐一查看字串中的所有符合項目。 
    private static String DumpHRefs(string inputString)
    {
        //-- 正規運算式（Regular Expression）
        string HRefPattern = "href\\s*=\\s*(?:\"(?<1>[^\"]*)\"|(?<1>\\S+))";

        //-- 使用 Match 物件來逐一查看字串中的所有符合項目。
        Match m = Regex.Match(inputString, HRefPattern,
                        RegexOptions.IgnoreCase | RegexOptions.Compiled);
        //-- Regex.Match() 方法。資料來源： http://msdn.microsoft.com/zh-tw/library/bk1x0726.aspx

        String str = null;
        while (m.Success)
        {
            str += "Found href ---" + m.Groups[1].ToString() + " at (字串位置) " + m.Groups[1].Index.ToString() + "<br />";
            m = m.NextMatch();
            //-- 呼叫 .Match.NextMatch()方法，自上次搜尋結束的地方開始執行另一個搜尋。
        }

        return str;
    }
}