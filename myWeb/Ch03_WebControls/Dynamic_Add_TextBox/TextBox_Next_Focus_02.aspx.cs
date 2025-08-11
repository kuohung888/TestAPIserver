using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TextBox_Next_Focus_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // ***  C#的 Page_Init事件  ***
    protected override void OnInit(EventArgs e)
    {
        for (int i = 1; i <= 5; i++ )
        {
            TextBox TB = new TextBox();
            TB.ID = "TextBox" + i;
            TB.Text = "動態產生" + i;
            TB.AutoPostBack = true;

            TB.TextChanged += new System.EventHandler(this.TextBox1_TextChanged);
            // HOW TO：在執行階段時動態繫結 ASP.NET Web 網頁中的事件處理常式
            // http://msdn.microsoft.com/zh-tw/library/t3d01ft1%28v=VS.100%29.aspx

            Page.Form.Controls.Add(TB);

            //==========================
            //== 加入 <br />換行符號
            Label LB = new Label();
            LB.Text = "<br /><br />";
            Page.Form.Controls.Add(LB);
        }           

        base.OnInit(e);
    }



    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        // 為了避免重複寫多個 TextBox的 TextChanged事件，而內容幾乎一樣，所以改成這樣。
        // 不然的話，您會用下面「冗長、重複」的程式來代替這一段。

        TextBox TB = (TextBox)sender;
        if (TB.UniqueID.Length == 8)
        {
            String ID_no = TB.UniqueID.Substring(7, 1);
            // 抓取 TextBox ID最後的流水號，例如 TextBox「1」

            TextBox TBnext = (TextBox)Page.Form.FindControl("TextBox" + (Convert.ToInt32(ID_no) + 1).ToString());
            //上集 第十八章的範例有提到，多重檔案、批次上傳。
            TBnext.Focus();
        }
    }
}