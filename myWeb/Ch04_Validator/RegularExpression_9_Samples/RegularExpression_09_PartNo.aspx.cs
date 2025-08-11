using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_09_PartNo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      string[] partNumbers= { "1298-673-4192", "A08Z-931-468A", 
                              "_A90-123-129X", "12345-KKA-1230", "0919-2893-1256" };

       //-- 正規運算式（Regular Expression）
       string pattern = @"^[a-zA-Z0-9]\d{2}[a-zA-Z0-9](-\d{3}){2}[A-Za-z0-9]$";

      foreach (string partNumber in partNumbers)
      {
            if (Regex.IsMatch(partNumber, pattern))
            {
                Label1.Text += String.Format("<font color=blue>{0} is a valid part number.</font><br />", partNumber);
            }
            else
            {
                Label1.Text += String.Format("<font color=red>{0} is NOT a valid part number.</font><br />", partNumber);
            }
      }

   }

}