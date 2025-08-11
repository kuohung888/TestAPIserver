using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_11_Dynamic_Generate_Controls_03_Error : System.Web.UI.Page
{

    //改成 Page_Init事件也會有狀況.........

    //protected void Page_Init(object sender, EventArgs e)
    //{   //*** 重  點！！**************************************
    //    //*** 請參閱上集，第十五章的範例 Page_Init.aspx。PostBack時，此事件 "會" 暫存「上次的值」。
    //    if (!Page.IsPostBack)
    //    {
    //        //第一次執行
    //    }
    //    else
    //    {
    //        Generate_Controls(Session["X"].ToString());
    //        //*** 自己寫的 function。動態產生控制項。
    //    }
    //}


    protected void Page_PreRender(object sender, EventArgs e)
    {   //*** 重  點！！**************************************
        //*** 請參閱上集，第十五章的範例 Page_Init.aspx。
        //*** PostBack時，Page_PreRender事件不保留（不暫存）「上次的值」。
        if (!Page.IsPostBack)
        {
            //第一次執行
        }
        else
        {
            Generate_Controls(Session["X"].ToString());
            //*** 自己寫的 function。動態產生控制項。
        }
    }


    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["X"] = RadioButtonList1.SelectedIndex.ToString();
    }


    //*******************************************************************************
    //*** 需要透過 .FindControl()方法才能作。請參閱上集第十章。
    //*******************************************************************************
    protected void Button1_Click(object sender, EventArgs e)
    {
        Get_Value();  //*** 自己寫的 function。抓取使用者輸入的「值」。。
    }


    //*******************************************************************************
    //*** 自己寫的 function。
    //*******************************************************************************
    protected void Generate_Controls(String str)
    {
        if (str == "0")
        {
            RadioButtonList RB = new RadioButtonList();
            RB.ID = "RadioButtonList2";
            RB.Items.Add(new ListItem("單選一Text", "單選一Value"));
            RB.Items.Add(new ListItem("單選二Text", "單選二Value"));
            RB.Items.Add(new ListItem("單選三Text", "單選三Value"));

            PlaceHolder1.Controls.Add(RB);
        }

        if (str == "1")
        {
            CheckBoxList CB = new CheckBoxList();
            CB.ID = "CheckBoxList1";
            CB.Items.Add(new ListItem("複選一Text", "複選一Value"));
            CB.Items.Add(new ListItem("複選二Text", "複選二Value"));
            CB.Items.Add(new ListItem("複選三Text", "複選三Value"));

            PlaceHolder1.Controls.Add(CB);
        }

        if (str == "2")
        {
            TextBox TB = new TextBox();
            TB.ID = "TextBox1";

            PlaceHolder1.Controls.Add(TB);
        }
        //也可以改成 swich... case的寫法，更簡潔。      
    }


    protected void Get_Value()
    {
        //*******************************************************************************
        //*** 需要透過 .FindControl()方法才能作。請參閱上集第十章。
        //*******************************************************************************
        if (PlaceHolder1.FindControl("RadioButtonList2") != null)
        {
            RadioButtonList RB = (RadioButtonList)PlaceHolder1.FindControl("RadioButtonList2");
            Response.Write("<h2>" + RB.SelectedValue + "</h2>");  //單選，被User點選的結果
        }
        //==========================================================

        if (PlaceHolder1.FindControl("CheckBoxList1") != null)
        {
            CheckBoxList CB = (CheckBoxList)PlaceHolder1.FindControl("CheckBoxList1");
            String str = null;
            for (int i = 0; i < CB.Items.Count; i++)
            {
                if (CB.Items[i].Selected)
                    str += CB.Items[i].Value;
            }
            Response.Write("<h2>" + str + "</h2>");  //複選，被User點選的結果
        }
        //==========================================================
        if (PlaceHolder1.FindControl("TextBox1") != null)
        {
            TextBox TB = (TextBox)PlaceHolder1.FindControl("TextBox1");
            Response.Write("<h2>" + TB.Text + "</h2>");  //文字輸入
        }
    }
}