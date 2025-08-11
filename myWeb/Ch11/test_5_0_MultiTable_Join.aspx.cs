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

public partial class Ch11_test_5_0_MultiTable_Join : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //== 自訂與修改GridView「表頭（Header）」=============================
        //==以下程式，參考：http://www.builder.com.cn/2007/1216/683754.shtml

        if (e.Row.RowType == DataControlRowType.Header)
        {
            //====只有「表頭」，才進行合併動作。因為是表頭，所以一個GridView只會作一次====

            //==== 自己新增，「自訂一列表頭」====================================
            GridViewRow myRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            //==參考資料： http://msdn2.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewrow.gridviewrow(VS.80).aspx
            //==先開一個GridViewRow

            TableCell headerCell_1 = new TableCell();
            headerCell_1.Text = "<font size=5>標題一   Table: [test]</font> ";    //==標題標題文字==
            headerCell_1.ColumnSpan = 4;      //==左右合併4個格子==
            headerCell_1.BackColor = System.Drawing.Color.YellowGreen;        //==背景顏色
            myRow.Cells.Add(headerCell_1);    //==新增一個 TableCell==

            TableCell headerCell_2 = new TableCell();
            headerCell_2.Text = "標題二   Table: [test_talk]";
            headerCell_2.ColumnSpan = 6;
            headerCell_2.BackColor = System.Drawing.Color.Tomato;   //==背景顏色，蕃茄紅==            
            myRow.Cells.Add(headerCell_2);

            myRow.Visible = true;
            GridView1.Controls[0].Controls.AddAt(0, myRow);    //==加入 GridView1裡面==
            //====http://msdn2.microsoft.com/zh-tw/library/system.web.ui.controlcollection.addat(VS.80).aspx
            //==ControlCollection.AddAt( index As Integer, child As Control )
            //==參 數--
            //==    index  陣列中要加入子控制項的位置。  [零]，表示從上算起，最上面那一列！
            //==    child  要加入到集合中的 Control。
        }
    }
}
