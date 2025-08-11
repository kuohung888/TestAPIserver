using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_11_Dynamic_Generate_Controls_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.Items[0].Selected)
        {
            RadioButtonList RB = new RadioButtonList();
            RB.ID = "RadioButtonList2";
            RB.Items.Add(new ListItem("單選一Text", "單選一Value"));
            RB.Items.Add(new ListItem("單選二Text", "單選二Value"));
            RB.Items.Add(new ListItem("單選三Text", "單選三Value"));

            PlaceHolder1.Controls.Add(RB);            
        }

        if (RadioButtonList1.Items[1].Selected)
        {
            CheckBoxList CB = new CheckBoxList();
            CB.ID = "CheckBoxList1";
            CB.Items.Add(new ListItem("複選一Text", "複選一Value"));
            CB.Items.Add(new ListItem("複選二Text", "複選二Value"));
            CB.Items.Add(new ListItem("複選三Text", "複選三Value"));

            PlaceHolder1.Controls.Add(CB);   
        }

        if (RadioButtonList1.Items[2].Selected)
        {
            TextBox TB = new TextBox();
            TB.ID = "TextBox1";

            PlaceHolder1.Controls.Add(TB);   
        }

        //也可以改成 swich... case的寫法，更簡潔。
    }


    //*******************************************************************************
    //*** 需要透過 .FindControl()方法才能作。請參閱上集第十章。
    //*******************************************************************************
    protected void Button1_Click(object sender, EventArgs e)
    {
        RadioButtonList RB = (RadioButtonList)PlaceHolder1.FindControl("RadioButtonList2");
        Response.Write("<h2>" + RB.SelectedValue + "</h2>");  //單選，被User點選的結果
        //==========================================================

        CheckBoxList CB = (CheckBoxList)PlaceHolder1.FindControl("CheckBoxList1");
        String str = null;
        for (int i = 0; i < CB.Items.Count; i++)
        {
            if (CB.Items[i].Selected)
                str += CB.Items[i].Value;
        }
        Response.Write("<h2>" + str + "</h2>");  //複選，被User點選的結果

        //==========================================================

        TextBox TB = (TextBox)PlaceHolder1.FindControl("TextBox1");
        Response.Write("<h2>" + TB.Text + "</h2>");  //文字輸入
    }
}