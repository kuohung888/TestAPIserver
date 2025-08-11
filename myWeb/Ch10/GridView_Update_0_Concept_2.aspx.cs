using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_0_Concept_2_Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("<font color=blue><h3>第一個GridView</h3>");

        for (int i = 0; i < 3; i++)
        {
            if (GridView1.Rows[1].Cells[i].HasControls())
            {
                Response.Write("第二列的" + i + "個格子(Cells)有" + GridView1.Rows[1].Cells[i].Controls.Count.ToString() + "個子控制項(Controls)<br />");

                LiteralControl lb = (LiteralControl)GridView2.Rows[1].Cells[2].Controls[0];
                Response.Write(".....第二列的第三個格子(Cells)有" + lb.Text + "<br />");
                //--任何不在伺服器上處理的 HTML 標記或文字字串，都會被視為 LiteralControl 物件。
                //--參考網址  http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.controls%28v=vs.80%29
            }
            else
            {
                Response.Write("<br /><br />第二列的" + i + "個格子(Cells) is No Controls");
            }
        }

        Response.Write("<br><br>====GridView1的第二列有幾個子控制項？==GridView1.Rows[1].Controls.Count====" + GridView1.Rows[1].Controls.Count.ToString() + "====<br /><br />");
        Response.Write("</font>");


        //======================================================
        Label3.Text = "<h3>第二個GridView（轉成樣版）</h3>";

        for (int j = 0; j < 3; j++)
        {
            if (GridView2.Rows[1].Cells[j].HasControls())
            {
                Label3.Text += "<hr />第二列的" + j + "個格子(Cells)有" + GridView2.Rows[1].Cells[j].Controls.Count.ToString() + "個子控制項(Controls)<br />";
            }
            else
            {
                Label3.Text += "第二列的" + j + "個格子(Cells) is No Controls<br /><br />";
            }
        }

        LiteralControl lb0 = (LiteralControl)GridView2.Rows[1].Cells[2].Controls[0];
        Label3.Text += "<br />.....第二列的第三個格子(Cells)，.Controls[0]集合有" + lb0.Text + "<br />";
        //--任何不在伺服器上處理的 HTML 標記或文字字串，都會被視為 LiteralControl 物件。
        //--參考網址  http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.controls%28v=vs.80%29

        Label lb1 = (Label)GridView2.Rows[1].Cells[2].Controls[1];
        Label3.Text += "<br />.....第二列的第三個格子(Cells)，.Controls[1]集合有" + lb1.Text + "<br />";

        LiteralControl lb2 = (LiteralControl)GridView2.Rows[1].Cells[2].Controls[2];
        Label3.Text += "<br />.....第二列的第三個格子(Cells)，.Controls[2]集合有" + lb2.Text + "<br />";

        //== 本範例來說，子控制項最多只有三個。超過三個就會報錯！
        // LiteralControl lb3 = (LiteralControl)GridView2.Rows[1].Cells[2].Controls[3];
        // Label3.Text += "<br />.....第二列的第三個格子(Cells)，.Controls[3]集合有" + lb3.Text + "<br />";


        Label3.Text += "<br><br>====GridView2的第二列有幾個子控制項？==GridView2.Rows[1].Controls.Count====" + GridView2.Rows[1].Controls.Count.ToString() + "====<br /><br />";


        Label lbFD = (Label)GridView2.Rows[1].Cells[2].FindControl("Label2");
        Label3.Text += "<br> .FindControl()方法 --" + lbFD.Text;
    }
}