using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch14_CaseStudy_FoodCalorie_Food_Calorie_Calculator_multi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["total"] == null)
        {
            ViewState["total"] = 0;
        }
        
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "-1")
        {
            Response.Write("您尚未選取DropDownList1任何一個選項");
        }


        //-- 點選任何一個子選項，底下的 ListBox就會出現，並立刻計算卡路里
        ListBox1.Items.Add(DropDownList1.SelectedItem.Text + "@" + DropDownList1.SelectedValue);

        Label1.Text = "<font color=blue>" + DropDownList1.SelectedValue + "</font>";  
        //-- 被選取的這項食物的卡路里

        ViewState["total"] = Convert.ToInt32(ViewState["total"]) + Convert.ToInt32(DropDownList1.SelectedValue);
        Label2.Text = ViewState["total"].ToString();
    }


    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //-- 點選 Listbox 的子選項，可以刪除之。
        int word_length = ListBox1.SelectedItem.Text.Length - (ListBox1.SelectedItem.Text.IndexOf("@", 0) + 1) ;
        Label1.Text = "<font color=red> -" + Right(ListBox1.SelectedItem.Text, word_length) + "</font>";  
        //-- 被選取的這項食物的卡路里

        ViewState["total"] = Convert.ToInt32(ViewState["total"]) - Convert.ToInt32(Right(ListBox1.SelectedItem.Text, word_length));
        Label2.Text = ViewState["total"].ToString();

        ListBox1.Items.Remove(ListBox1.SelectedItem.Text);  
        //-- 移除 ListBox1「被選到的」子選項
    }



    //=======================================
    public static string Right(string sSource, int iLength)
    {
        return sSource.Substring(iLength > sSource.Length ? 0 : sSource.Length - iLength);
    } 

}