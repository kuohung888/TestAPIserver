using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_07_SQL_Injection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string inputString = "SQL Injection：123、@、-、.、--、'、1=1、!、我";

        Label1.Text = CleanInput1(inputString);     //-- 自訂的函數
        Label2.Text = CleanInput2(inputString);     //-- 自訂的函數
    }

    //=========================================
    // 資料來源：http://msdn.microsoft.com/zh-tw/library/844skk0h.aspx
    static string CleanInput1(string strIn)
    {
        //-- 正規運算式（Regular Expression）
        return Regex.Replace(strIn, @"[^\w\.@!]", "");
        //成功地排除一些攻擊字眼。也保留了使用者可用的特殊符號（如英文句號（.）、@符號、 ! 符號）
        //符合這個模式的任何字元都會由 String.Empty 取代
    }


    static string CleanInput2(string strIn)
    {
        //-- 正規運算式（Regular Expression）
        return Regex.Replace(strIn, @"[\w\.@!]", "");
    }
}