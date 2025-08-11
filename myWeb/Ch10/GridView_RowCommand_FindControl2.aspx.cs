using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_RowCommand_FindControl2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //Response.Write("*** RowCreated事件 ***<br />");   //優先執行這個事件！

        // The GridViewCommandEventArgs class does not contain a
        // property that indicates which row's command button was
        // clicked. To identify which row was clicked, use the button's
        // CommandArgument property by setting it to the row's index.
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Retrieve the LinkButton control from the first column.
            LinkButton addButton = (LinkButton)e.Row.Cells[0].Controls[0];

            // Set the LinkButton's CommandArgument property with the row's index.
            addButton.CommandArgument = e.Row.RowIndex.ToString();
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Response.Write("=== RowCommand事件 ===<br>");

        // If multiple ButtonField columns are used, use the
        // CommandName property to determine which button was clicked.
        if (e.CommandName == "Add")
        {
            // 上一個事件，已經把每一列的索引數（Index），設定在按鈕裡面了！
            int index = Convert.ToInt32(e.CommandArgument);

            // 方法一：MSDN的作法
            // Retrieve the row that contains the button clicked by the user from the Rows collection. 
            // Use the CommandSource property to access the GridView control.
            GridView GV = (GridView)e.CommandSource;
            GridViewRow row = GV.Rows[index];

            ////方法二：延續上一個範例的作法。****發生錯誤**** WHY  ??????   請看下一個範例的解答
            //// 本範例的按鈕，並非轉成樣板而加入的Button。
            //// 而是使用了 GirdView自身的「ButtonField」來做，所以寫法不同！

            //LinkButton BTN = (LinkButton)e.CommandSource;    //****發生錯誤**** 請看看錯誤訊息的意思！
            //GridViewRow row = (GridViewRow)BTN.NamingContainer;
            //// 從你按下 Button按鈕的時候，NamingContainer知道你按下的按鈕在GridView「哪一列」！


            // 把GridView的兩個欄位，動態加入 ListBox裡面（當成子項目 ListItem）
            ListItem item = new ListItem();
            item.Text = Server.HtmlDecode(row.Cells[1].Text) + " " + Server.HtmlDecode(row.Cells[3].Text);
            if (!ListBox1.Items.Contains(item))
            {
                ListBox1.Items.Add(item);
            }
        }
    }
}