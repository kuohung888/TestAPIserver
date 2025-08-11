using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch09_GridView_Multi_PK_2_Session : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["s_id"] = Convert.ToInt32(GridView1.SelectedDataKey.Values[0]);    // 第一個索引鍵（整數型態）
        Session["s_title"] = GridView1.SelectedDataKey.Values[1].ToString();    // 第二個索引鍵（字串型態）

        //-- 請比對一下 HTML碼裡面， SqlDataSource2的兩個參數
        //<SelectParameters>
        //    <asp:SessionParameter Name="id" SessionField="s_id" Type="Int32" />         註：整數型態
        //    <asp:SessionParameter Name="title" SessionField="s_title" Type="String" />  註：字串
        //</SelectParameters>
    }
}