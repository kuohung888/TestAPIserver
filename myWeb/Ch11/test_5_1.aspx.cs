using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch11_test_5_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        //== 合併相同內容的「列」
        //== 參考資料： http://epaper.blueshop.com.tw/board/show.asp?subcde=BRD20061225110536B4G&fumcde=FUM20050124192253INM
        //== 這區的程式碼，寫在 GridView1_DataBound() 事件裡面也可以

        int i = 1;

        foreach (GridViewRow wkItem in GridView1.Rows)
        {

            if (Convert.ToInt32(wkItem.RowIndex) == 0)
            {
                wkItem.Cells[0].RowSpan = 1;   //第一個格子（Cells[0]）並不作比較，當作旗標。
            }
            else
            {
                //==比較 "上一列"的數值 是否與目前這一列相同?  相同的話，RowSpan要合併
                if (wkItem.Cells[0].Text.Trim() == GridView1.Rows[Convert.ToInt32(wkItem.RowIndex) - i].Cells[0].Text.Trim())
                {
                    GridView1.Rows[Convert.ToInt32(wkItem.RowIndex) - i].Cells[0].RowSpan += 1;
                    i++;
                    wkItem.Cells[0].Visible = false;   //還在統計中，所以"合併列"設定為「看不見」
                }
                else
                {
                    //== 與上一格的「內容物」不相同時，表示這是新的一列，不需要合併！ RowSpan 變成原本的值 1。
                    GridView1.Rows[Convert.ToInt32(wkItem.RowIndex)].Cells[0].RowSpan = 1;
                    i = 1;   //與上一個格子不相同時， i 變成原本的值 1，表示"合併列"要從頭計算～
                }
            }

        }   // for迴圈結束

    }

}
