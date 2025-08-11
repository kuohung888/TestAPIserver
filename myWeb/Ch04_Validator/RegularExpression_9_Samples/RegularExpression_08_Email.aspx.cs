using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_08_Email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] emailAddresses = { "david.jones@proseware.com", "d.j@server1.proseware.com", 
                                  "jones@ms1.proseware.com", "j.@server1.proseware.com", 
                                  "j@proseware.com9", "js#internal@proseware.com", 
                                  "j_9@[129.126.118.1]", "j..s@proseware.com", 
                                  "js*@proseware.com", "js@proseware..com", 
                                  "js@proseware.com9", "j.s@server1.proseware.com" };

        foreach (string emailAddress in emailAddresses)
        {
            if (IsValidEmail(emailAddress))   //-- 自訂的函數
                Label1.Text += String.Format("<font color=blue>Valid: {0}", emailAddress) + "</font><br />";
            else
                Label1.Text += String.Format("<font color=red>Invalid: {0}", emailAddress) + "</font><br />";
        }   
    }


    //=========================================
    // 資料來源：http://msdn.microsoft.com/zh-tw/library/01escwtf.aspx
    public static bool IsValidEmail(string strIn)
    {
        //-- 正規運算式（Regular Expression）
        // Return true if strIn is in valid e-mail format.
        return Regex.IsMatch(strIn,
               @"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))" +
               @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$");

        // Regex.IsMatch 方法 (String, String)。您可以參閱下一個範例，繼續學習。
        // -- http://msdn.microsoft.com/zh-tw/library/sdx2bds0.aspx
    }

}