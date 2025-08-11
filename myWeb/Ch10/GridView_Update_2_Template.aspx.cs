using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_2_Template : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //==抓取「編輯」模式裡面，使用者修改後的欄位值。

        Response.Write("對應 test資料表的主索引鍵 --" + GridView1.DataKeys[e.RowIndex].Value.ToString());


        //*********************************
        //重點來了!! 以下兩行程式碼跟上一個範例不同!!
        //*********************************
        //以下兩種寫法，請您任選其一

        TextBox tb = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("TextBox1");
        // TextBox tb = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        //或是寫成 TextBox tb = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;

        Response.Write("<br /> title -- " + tb.Text);

        //Response.End();  //==因為本範例的 GridView搭配 SqlDataSource，不寫這一列程式會出現錯誤。
    }
}