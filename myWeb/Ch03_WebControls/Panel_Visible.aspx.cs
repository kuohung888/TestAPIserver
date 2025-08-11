using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Book_New_Samples_Panel_Panel_Visible : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //-- 題目：請問您的性別
        if(RadioButtonList1.SelectedValue == "男" )
        {
            Panel1.Visible = true;
            Panel2.Visible = false;

            Label1.Text = "您是「男性」<br />";
        }
           
        if(RadioButtonList1.SelectedValue == "女")
        {
            Panel2.Visible = true;
            Panel1.Visible = false;

            Label1.Text = "您是「女性」<br />";
        }
    }


    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //-- 題目：請問您當兵了沒？
        switch (RadioButtonList2.SelectedValue.ToString())
        {
            case "Yes":
                Panel3.Visible = true;
                Label1.Text += "您「當過兵」<br />";
                break;
            case "No":
                Response.Write("<script language=\"JavaScript\">window.alert(\"這個選項沒作用，抱歉。請改選「Yes」。\");</script>");
                Panel3.Visible = false;
                Label1.Text = "您是「男性」<br />您「沒有」當過兵<br />";
                break;
            default:
                //-- 以上皆非時，會出現這個結果。但在本範例應該用不到。
                Response.Write("<script language=\"JavaScript\">window.alert(\"請改選「Yes」。\");</script>");
                break;

        //=====================================
        //== 上述 switch寫法，跟上一個事件的兩個 if判別式，是一樣的成果。不同的寫法而已。
        }
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text += DropDownList1.SelectedValue + "<br />";
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label1.Text += Calendar1.SelectedDate.ToString();
    }
}