using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告） ====
using System.Text.RegularExpressions;
//== 自己寫的（宣告） ====


public partial class Book_Sample_Ch04_Validator_RegularExpression_06_http_port : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //-- 資料來源
        string url = "http://www.dotblogs.com.tw:8080/mis2000lab/123.htm";

        //-- 正規運算式（Regular Expression）
        Regex r = new Regex(@"^(?<proto>\w+)://[^/]+?(?<port>:\d+)?/");

        Match m = r.Match(url);
        if (m.Success)
        {
            //-- 下列程式碼使用 Match.Result()方法和兩個替代項目 (${proto} 和 ${port})，讓輸出字串包含擷取的群組。 
            //-- 您可以改為從相符項目的 GroupCollection物件中擷取該群組，如下列程式碼所示。 

            Label1.Text += r.Match(url).Result("${proto}${port}"); 
            //-- 使用 Match.Result()方法來傳回通訊協定和通訊埠編號 (中間以冒號隔開)。
            //-- http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.match.result.aspx

            //-- Match.Result()方法會展開 ${proto}${port} 取代序列，以將規則運算式模式中所擷取之兩個具名群組的值串連。 
            //-- 另一種方便的做法是將 Match.Groups屬性所傳回的集合物件中擷取的字串串連。
        }
            
    }
}