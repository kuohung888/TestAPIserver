using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_Web_Calculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //--第一次執行程式
            ViewState["cal_input"] = "";      //-- 使用者輸入的數字
            ViewState["cal_singal"] = "0";   //-- 有無按下運算符號（+ / - / * / %）
            ViewState["cal_sum"] = 0;       //-- 運算後的結果
        }
        //-- 寫程式的時候，我會即時把[變數值]列印到銀幕上，觀察程式有無寫錯。
        // Response.Write(ViewState["cal_input"].ToString() + "<br />");
        // Response.Write(ViewState["cal_singal"].ToString() + "<br />");
        // Response.Write(ViewState["cal_sum"].ToString() + "<br />");
    }


    protected void ButtonCE_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = "";
        ViewState["cal_singal"] = "0";
        ViewState["cal_sum"] = 0;
        //-- 按下 [CE清除]按鍵，數字歸零

        TextBox1.Text = "0";    //-- 畫面歸零
        Label1.Text = "歸零";
    }


    protected void ButtonEnd_Click(object sender, EventArgs e)
    {
        //-- 運算完畢，輸入「=」計算出結果。
        Label1.Text = "運算完畢 !!";

        if (ViewState["cal_singal"].ToString() != "+")
        {
            ViewState["cal_sum"] = Convert.ToInt32(ViewState["cal_sum"]) + Convert.ToInt32(ViewState["cal_input"]);
            TextBox1.Text = ViewState["cal_sum"].ToString();
        }

        //--運算完畢，按下「=」符號後，如果要繼續運算的話....
        ViewState["cal_input"] = Convert.ToInt32(ViewState["cal_sum"]);
        ViewState["cal_singal"] = "";
    }


    protected void Button_x1_Click(object sender, EventArgs e)
    {
        //--加法--
        Label1.Text = "加法（＋）運算";
        TextBox1.Text = ViewState["cal_input"].ToString();

        if (ViewState["cal_singal"].ToString() == "0")
            //-- 第一次按下「+ 加法」按鈕
            ViewState["cal_sum"] = Convert.ToInt32(ViewState["cal_input"]);
        else
        {
            ViewState["cal_sum"] = Convert.ToInt32(ViewState["cal_sum"]) + Convert.ToInt32(ViewState["cal_input"]);
        }
            

        TextBox1.Text = ViewState["cal_sum"].ToString();  //--畫面更新

        ViewState["cal_singal"] = "+";
        ViewState["cal_input"] = "0";   //--數字歸零，等待下一次輸入
    }



    //== 數 字 ============================================================
    //== 以下程式的重複性太高，可以濃縮在一起。請看下一個範例 Web_Calculator_sender.aspx。

    protected void Button0_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "0";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "1";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "2";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "3";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "4";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "5";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "6";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "7";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "8";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        ViewState["cal_input"] = ViewState["cal_input"].ToString() + "9";
        TextBox1.Text = ViewState["cal_input"].ToString();
    }


}