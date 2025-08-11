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

public partial class Ch10_Default_book_4_Select : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Write("<font color=blue>RowCommand事件<hr>");
        
        //--這裡的 e，跟下面 SelectedIndexChanged()事件的 e。不一樣！
        Response.Write("<br />####您按下的動作，e  =  " + e.ToString());
        Response.Write("<br />####您按下的按鈕，e.CommandName =  " + e.CommandName.ToString());


        //----使用這兩行，會出現錯誤！
        //Response.Write("<br />####（PK）。GridView1.SelectedValue = " + GridView1.SelectedValue.ToString());
        //Response.Write("<br />####（PK）。GridView1.SelectedDataKey = " + GridView1.SelectedDataKey.Value);

        Response.Write("<hr />####GridView1.SelectedIndex = Gridview畫面上第幾列（從零算起）-- " + GridView1.SelectedIndex);
        Response.Write("</font>");
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("<br><br><font color=red>SelectedIndexChanged事件<hr>");

        //-- 按下「選取(Select)」按鈕之後，出現Table的Primary Key。
        //-- 如果是自己制定的按鈕（CommandName="my_Button"）, 則無效

        Response.Write("<br />####您按下的動作，e  =  " + e.ToString());

        Response.Write("<br />####（PK）。GridView1.SelectedValue = " + GridView1.SelectedValue.ToString());
        Response.Write("<br />####（PK）。GridView1.SelectedDataKey = " + GridView1.SelectedDataKey.Value);

        Response.Write("<hr />####GridView1.SelectedIndex = Gridview畫面上第幾列（從零算起）-- " + GridView1.SelectedIndex);
        Response.Write("</font>");
    }
}
