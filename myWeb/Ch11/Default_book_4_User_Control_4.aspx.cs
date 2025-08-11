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

public partial class Ch11_Default_book_4_User_Control_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //==使用者一點選，就會把點選的「那一列」數字，存起來!   存在Session[]裡面
        Session["myGridViewNum"] = Convert.ToInt32(GridView1.SelectedIndex.ToString());

        GridView1.DataBind();   //==一定要加這一行！==
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //==換頁的時候，將所有狀態都恢復原狀！==
        Session["myGridViewNum"] = -1;
        GridView1.SelectedIndex = -1;

        GridView1.PageIndex = e.NewPageIndex;   //==換頁==
        GridView1.DataBind();
    }


    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        //==排序(Sorting)的時候，將所有狀態都恢復原狀！==
        Session["myGridViewNum"] = -1;
        GridView1.SelectedIndex = -1;

        GridView1.DataBind();
    }


    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //== GridView1_RowCreated() ----建立 GridView 控制項中的資料列時發生

        //==必須先為控制項中的每個"資料列"建立 GridViewRow 物件，才能呈現 GridView 控制項。
        //==建立 GridView 控制項中的每個資料列時，會引發 RowCreated 事件。
        //==這可讓您提供事件處理方法，用於每次發生這個事件時執行自訂常式，例如:將自訂內容加入至資料列。

        //==GridViewRowEventArgs 物件 (e) 會傳遞至事件處理方法，讓您存取正在建立之 "資料列" 的屬性。
        //==若要存取資料列中的"特定儲存格"，請使用 GridViewRowEventArgs 物件 (e) 的 Cells 屬性，例如: e.Row.Cells。
        //==您可以使用 e.Row.RowType 屬性決定建立哪種資料列型別 (標頭資料列、資料列等)。

        int user_selected = Convert.ToInt32(Session["myGridViewNum"]);

        if (user_selected >= 0 & e.Row.RowType == DataControlRowType.Pager)
        {
            //==== .Pager表示GridView已經完成最底下[分頁]功能的格子，整個GridView都已經完成了
            //====如果改成 .DataRow，就會重複產生N次相同內容。因為 N = GridView有幾列資料！

            GridViewRow myRow = new GridViewRow((user_selected + 1), -1, DataControlRowType.DataRow, DataControlRowState.Selected);
            //==先開一個GridViewRow (表示 GridView 控制項中的 "個別"資料列。)
            //==參考資料： http://msdn2.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewrow.gridviewrow(VS.80).aspx
            //==只有設定 RowType = DataRow，才能使用資料繫結


            //----我們手動新增的這一列，名為 myRow，裡面會有三個格子。

            //----以下是自己新增的三個格子（TableCell）--------------(start)------------------------
            TableCell headerCell_0 = new TableCell();
            headerCell_0.BackColor = System.Drawing.Color.RoyalBlue;  //==設定底色
            myRow.Cells.Add(headerCell_0);       //==新增一個 TableCell，避開第一格的「按鈕」
            //==myRow.Cells表示 : 取得TableCell 物件的集合，表示Table 控制項中資料列的儲存格。

            TableCell headerCell_1 = new TableCell();
            headerCell_1.BackColor = System.Drawing.Color.RoyalBlue;   //==設定底色
            myRow.Cells.Add(headerCell_1);

            //==== 重點來了！  ====
            //==== 這個儲存格（格子）內，將會放置我們的GridView2（使用者控制項）
            TableCell headerCell_2 = new TableCell();
            headerCell_2.ColumnSpan = 3;
            //==或是寫成 headerCell_1.ColumnSpan = CInt(GridView1.Columns.Count)
            //==合併所有格子變成[一列]，來呈現另一個 GridView2 (使用者控制項，User Control)
            headerCell_2.BackColor = System.Drawing.Color.RoyalBlue;    //==設定底色

            //==避免第一次載入網頁，就看見 GridView2的錯誤訊息（找不到資料），所以第一次不執行這一塊==
            if (Page.IsPostBack)
            {
                UserControl my_uc = new UserControl();
                my_uc = (UserControl)LoadControl("Default_book_4_UserControl_2.ascx");
                headerCell_2.Controls.Add(my_uc);   //==在這一格裡面，加入 GridView2 [使用者控制項，User Control]

                myRow.Cells.Add(headerCell_2);
                //==加入 使用者控制項之後，才把這一格，真正加入我們手動新增的那一列 myRow

                //----以上是自己新增的三個格子（TableCell）--------------(end)------------------------

                myRow.Visible = true;
                GridView1.Controls[0].Controls.AddAt((user_selected + 2), myRow);
                //==把 自己新增的那一列myRow，加入 GridView1裡面，加在"展開那一列"的下方。
                //==因為包含最上方的「表頭」那一列，所以要加二。
                //==參考資料： http://msdn2.microsoft.com/zh-tw/library/system.web.ui.controlcollection.addat(VS.80).aspx
                //==ControlCollection.AddAt( index As Integer, child As Control )
                //==    參 數--
                //==    index  陣列中要加入子控制項的位置。 
                //==    child  要加入到集合中的 Control (子控制項)。

                //== 測試用 ============================
                //Response.Write(GridView1.Controls(0).ClientID);
                // 文章請看：http://www.dotblogs.com.tw/mis2000lab/archive/2012/11/12/gridview_controls.aspx
            }
        }
    }
}
