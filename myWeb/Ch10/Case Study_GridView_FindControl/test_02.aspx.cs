using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_test_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["RowIndex"] = 0;
           // ViewState["RowIndex"] = 0;
        }
    }

    //=========================================
    //== 請注意，VB程式在 這個事件後面的「Handles」不見了！！
    //=========================================
    protected void Button1_Click(object sender, EventArgs e)
    {
        DropDownList my_DDL = new DropDownList();
        //my_DDL = (DropDownList)GridView1.Rows[Convert.ToInt32(Session["RowIndex"])].FindControl("DropDownList1");
        //-- 修改以後就正確了！
        //my_DDL = (DropDownList)GridView1.Rows[Convert.ToInt32(ViewState["RowIndex"])].FindControl("DropDownList1");
        //my_DDL = (DropDownList)GridView1.Rows[GridView1.SelectedIndex].FindControl("DropDownList1");
        my_DDL = (DropDownList)GridView1.SelectedRow.FindControl("DropDownList1");

        Response.Write("<font color=blue>您觸發了 Button1_Click事件！</font><br>");

        Response.Write("<font color=red>");
        Response.Write("您選的 DropDownList的 ClientID是「" + my_DDL.ClientID + "」。<br>");
        Response.Write("您選的 DropDownList的 子選項是「" + my_DDL.SelectedValue + "」。<br>");
        Response.Write("</font >");
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //-- 這個事件僅供參考，
        //-- 是用來瞭解 參數e的型態。

        Session["RowIndex"] = GridView1.SelectedIndex;

        //== 重  點！！！ ======
        //-- 如果改用 ViewState會出現問題。
        //ViewState["RowIndex"] = GridView1.SelectedIndex;
    }
}