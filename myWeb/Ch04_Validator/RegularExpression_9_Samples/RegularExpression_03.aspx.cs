using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Collections.Generic;
using System.Globalization;
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Define text to be parsed.
        string input = "Office expenses on 2/13/2008:\n" +
                       "Paper (500 sheets)                      $3.95\n" +
                       "Pencils (box of 10)                     $1.00\n" +
                       "Pens (box of 10)                        $4.49\n" +
                       "Erasers                                 $2.19\n" +
                       "Ink jet printer                        $69.95\n\n" +
                       "Total Expenses                        $ 81.58\n";

        // Get current culture's NumberFormatInfo object.
        NumberFormatInfo nfi = CultureInfo.CurrentCulture.NumberFormat;
        // Assign needed property values to variables.
        string currencySymbol = nfi.CurrencySymbol;
        bool symbolPrecedesIfPositive = nfi.CurrencyPositivePattern % 2 == 0;
        string groupSeparator = nfi.CurrencyGroupSeparator;
        string decimalSeparator = nfi.CurrencyDecimalSeparator;

        // Form regular expression pattern.
        string pattern = Regex.Escape(symbolPrecedesIfPositive ? currencySymbol : "") +
                         @"\s*[-+]?" + "([0-9]{0,3}(" + groupSeparator + "[0-9]{3})*(" +
                         Regex.Escape(decimalSeparator) + "[0-9]+)?)" +
                         (!symbolPrecedesIfPositive ? currencySymbol : "");
        Label1.Text = "The regular expression pattern is: " + "<br />";
        Label1.Text += "   " + pattern + "<hr />";

        // Get text that matches regular expression pattern.
        //-- 對於每個符合項目，它會擷取只包含數值字串的子群組
        MatchCollection matches = Regex.Matches(input, pattern,
                                                RegexOptions.IgnorePatternWhitespace);
        Label1.Text += String.Format("Found {0} matches.", matches.Count) + "<br / >";

        // Get numeric string, convert it to a value, and add it to List object.
        List<decimal> expenses = new List<Decimal>();

        foreach (Match match in matches)
            expenses.Add(Decimal.Parse(match.Groups[1].Value));

        // Determine whether total is present and if present, whether it is correct.
        //-- 將這個字串轉換為 Decimal 值，然後計算累計總數。
        decimal total = 0;
        foreach (decimal value in expenses)
            total += value;

        if (total / 2 == expenses[expenses.Count - 1])
            Label1.Text += String.Format("The expenses total {0:C2}.", expenses[expenses.Count - 1]) + "<br / >";
        else
            Label1.Text += String.Format("The expenses total {0:C2}.", total) + "<br / >";
    }
}