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

public partial class Ch11_test_5_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        //== 合併相同內容的「列」
        //== 參考資料： http://epaper.blueshop.com.tw/board/show.asp?subcde=BRD20061225110536B4G&fumcde=FUM20050124192253INM
        //== 這區的程式碼，寫在 GridView1_DataBound() 裡面也可以
        int i  = 1;
        int AlternatingRowStyle_i  = 1;


        foreach (GridViewRow mySingleRow in GridView1.Rows)
	    {
            //== mySingleRow代表 GridView所有列(GridView1.Rows )裡面的 的 每一個列
            if (Convert.ToInt32(mySingleRow.RowIndex) == 0)
            {
                //== 只做第一次。
                //== 因為GridView的「第一列」的格子們，只當作比較用的「旗標」。  
                //== 預設值 .RowSpan = 1
                mySingleRow.Cells[0].RowSpan = 1;
                mySingleRow.Cells[1].RowSpan = 1;
                mySingleRow.Cells[2].RowSpan = 1;
                mySingleRow.Cells[3].RowSpan = 1;
            }
            else
            {
                if (mySingleRow.Cells[0].Text.Trim() == GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex) - i].Cells[0].Text.Trim())
                {
                    //== 比較 "上一列" 的「格子」內容物 是否與目前這一列相同?  相同的話，.RowSpan要跟前面那些列合併
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex) - i].Cells[0].RowSpan += 1;
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex) - i].Cells[1].RowSpan += 1;
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex) - i].Cells[2].RowSpan += 1;
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex) - i].Cells[3].RowSpan += 1;

                    i++;
                    mySingleRow.Cells[0].Visible = false;   //== 還在統計中，所以 "被人合併掉的那一列" 設定為「看不見（消失了）」
                    mySingleRow.Cells[1].Visible = false;
                    mySingleRow.Cells[2].Visible = false;
                    mySingleRow.Cells[3].Visible = false;
                }
                else
                {
                    //----- 因為手動合併列的緣故，原本GridView的隔行變色功能會出現意外的結果，無法使用了 ---------
                    //----- 只好自己寫程式來處理「隔行變色(AlternatingRowStyle)」的功能 -------------------------------------------
                    if (((AlternatingRowStyle_i) % 2) != 0)
                    //註解： %代表除法所得的「餘數」。
                    //      除以2而且餘數為0，就是偶數！
                    {
                        GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[0].BackColor = System.Drawing.Color.Orange;
                        GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[1].BackColor = System.Drawing.Color.Orange;
                        GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[2].BackColor = System.Drawing.Color.Orange;
                        GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[3].BackColor = System.Drawing.Color.Orange;
                    }
                    AlternatingRowStyle_i += 1;
                    //----------------------------------------------------------------------------------------------------------------------------------------------------

                    //== 與上一個格子的「內容物」不相同時，表示這一列是嶄新的一列，不需要合併！
                    //== RowSpan 變成原本的值 1，表示"合併列"要從頭計算～
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[0].RowSpan = 1;
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[1].RowSpan = 1;
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[2].RowSpan = 1;
                    GridView1.Rows[Convert.ToInt32(mySingleRow.RowIndex)].Cells[3].RowSpan = 1;
                    i = 1;     //== i 變成原本的值 1，表示"合併列"要從頭計算～
                }
            }
	 
	   }   // for迴圈結束

    }
}
