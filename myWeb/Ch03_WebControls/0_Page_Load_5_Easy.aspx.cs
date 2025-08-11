using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_0_Page_Load_0_Easy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String str1 = "<table align=center class=auto-style3 border=1>";
        str1 += "  <tr>";
        str1 += "     <td class=auto-style5>產品名稱</td>";
        str1 += "     <td class=auto-style5>產品代號</td>";
        str1 += "  </tr>";
        str1 += "  <tr>";
        str1 += "     <td class=auto-style5><b>快樂牌綠茶</b></td>";
        str1 += "     <td class=auto-style5><b>Happy Green Tea</b></td>";
        str1 += "  </tr>";
        str1 += "</table>";
        Label1.Text = str1;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        String str1 = "<table align=center class=auto-style4 border=1>";
        str1 += "  <tr>";
        str1 += "     <td class=auto-style10>錫蘭紅茶</td>";
        str1 += "     <td class=auto-style10>Black Tea</td>";
        str1 += "  </tr>";
        str1 += "</table>";
        Label1.Text += str1;
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        String str1 = "<table align=center class=auto-style6 border=1>";
        str1 += "  <tr>";
        str1 += "     <td class=auto-style7>美國可樂</td>";
        str1 += "     <td class=auto-style7>Amercian Cola</td>";
        str1 += "  </tr>";
        str1 += "</table>";
        Label1.Text += str1;
    }
}