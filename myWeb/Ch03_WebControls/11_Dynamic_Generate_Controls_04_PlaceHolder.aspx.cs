using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_11_Dynamic_Generate_Controls_03_PlaceHolder : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {   //*** 重 點！！**************************************
        //***動態產生控制項，務必放在 Page_Init事件裡面！！
        //*************************************************
        if (!Page.IsPostBack)
        {
            //第一次執行
        }
        else
        {
            Response.Write("Request[\"RadioButtonList1.UniqueID\"] --" + Request[RadioButtonList1.UniqueID].ToString());
            //透過 Request抓到的子控制項，Index不是從零開始，而是從一開始。

            //**************************************
            int i = Convert.ToInt32(Request[RadioButtonList1.UniqueID]);

            Generate_Controls(i);    //*** 重 點！！***。
            //*** 自己寫的 function。動態產生控制項。***
        }
    }



    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //-- 這個事件，完全不用寫。*** 奇怪啊！***
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Get_Value();  //*** 自己寫的 function。抓取使用者輸入的「值」。
    }


    //*******************************************************************************
    //*** 自己寫的 function。
    //*******************************************************************************
    protected void Generate_Controls(int str)
    {
        if (str == 1)
        {
            RadioButtonList RB = new RadioButtonList();
            RB.ID = "RadioButtonList2";
            RB.Items.Add(new ListItem("單選一Text", "單選一Value"));
            RB.Items.Add(new ListItem("單選二Text", "單選二Value"));
            RB.Items.Add(new ListItem("單選三Text", "單選三Value"));

            PlaceHolder1.Controls.Add(RB);
        }

        if (str == 2)
        {
            CheckBoxList CB = new CheckBoxList();
            CB.ID = "CheckBoxList1";
            CB.Items.Add(new ListItem("複選一Text", "複選一Value"));
            CB.Items.Add(new ListItem("複選二Text", "複選二Value"));
            CB.Items.Add(new ListItem("複選三Text", "複選三Value"));

            PlaceHolder1.Controls.Add(CB);
        }

        if (str == 3)
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
            //寫成這兩種寫法也行，請看書本上的說明。
            //因為PlaceHolder與Panel都沒實作INamingContainer，所以可以直接使用FindControl()方法，不必寫PlacerHolder1.FindControl()。
            //TextBox TB = (TextBox)FindControl("TextBox1");
            //TextBox TB = (TextBox)Page.FindControl("TextBox1");
            Response.Write("<h2>" + TB.Text + "</h2>");  //文字輸入
        }
    }


}