using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_11_Dynamic_Generate_Controls_05_Nest : System.Web.UI.Page
{

    //override protected void OnInit(EventArgs e)
    //{  //--這是方法！！ OnInit方法！跟下面的「Page_Init事件」有點不同。
    //    //-- http://msdn.microsoft.com/zh-tw/library/cd6at422.aspx
    //    TextBox TB = new TextBox();
    //    TB.ID = "TextBox1";
    //    TB.Text = "動態加入的TextBox";

    //    Panel PL = new Panel();
    //    PL.ID = "Panel1";
    //    PL.Controls.Add(TB);

    //    //**** 最後才加入頁面。這樣便是「巢狀」動態加入控制項！ ****
    //    Page.Form.Controls.Add(PL); 
    //}

    protected void Page_Init(object sender, EventArgs e)
    {  //--這是事件！！
        TextBox TB = new TextBox();
        TB.ID = "TextBox1";
        TB.Text = "動態加入的TextBox";

        Panel PL = new Panel();
        PL.ID = "Panel1";
        PL.Controls.Add(TB);

        //**** 最後才加入頁面。這樣便是「巢狀」動態加入控制項！ ****
        Page.Form.Controls.Add(PL); 
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }




}