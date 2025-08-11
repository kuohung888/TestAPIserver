using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Dynamic_Generate_Controls_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.Items[0].Selected)
        {
            RadioButtonList2.Visible = true;
            
            CheckBoxList1.Visible = false;
            TextBox1.Visible = false;                        
        }
        if (RadioButtonList1.Items[1].Selected)
        {
            CheckBoxList1.Visible = true;
            
            RadioButtonList2.Visible = false;
            TextBox1.Visible = false;
        }
        if (RadioButtonList1.Items[2].Selected)
        {
            TextBox1.Visible = true;
            
            RadioButtonList2.Visible = false;
            CheckBoxList1.Visible = false;
        }
        
        //也可以改成 swich... case的寫法，更簡潔。
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<h2>" + RadioButtonList2.SelectedValue + "</h2>");  //單選，被User點選的結果

        String str = null;
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
                str += CheckBoxList1.Items[i].Value;
        }
        Response.Write("<h2>" + str + "</h2>");  //複選，被User點選的結果

        Response.Write("<h2>" + TextBox1.Text + "</h2>");  //文字輸入
    }
}