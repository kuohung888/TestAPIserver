using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_1 : System.Web.UI.Page
{

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //==抓取「編輯」模式裡面，使用者修改後的欄位值。

        Response.Write("<big>對應 test資料表的主索引鍵 --" + GridView1.DataKeys[e.RowIndex].Value.ToString());

        //========================================
        //== 如果您把 id欄位的HTML標籤，取消這一段 ReadOnly="True" 
        //== 便可以使用下面的程式碼了。
        //TextBox tb1 = new TextBox();
        //tb1 = (TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0];
        //Response.Write("<br /> id -- " + tb1.Text);        
        //========================================

        if (GridView1.Rows[e.RowIndex].Cells[2].HasControls())  //==先判斷這個格子裡面，是否有「子控制項」？
        {
            TextBox tb = new TextBox();
            tb = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];

            Response.Write("<br /> title -- " + tb.Text + "</big>");
        }


        Response.End();  //==因為本範例的 GridView搭配 SqlDataSource，不寫這一行會出現錯誤。
    }


}