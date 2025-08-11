using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_Session_AllenKuo : System.Web.UI.Page
{

    

    protected void Page_Load(object sender, EventArgs e)
    {
        ////第一種寫法，容易寫錯字。因為Session裡面的 "變數名稱" 必須自己打字
        //// 變數名稱如果字太長，就容易寫錯字！
        //int a = 100;
        //int b = 23;
        //Session["ComputeResult"] = a + b;

        //Label1.Text = Session["ComputeResult"].ToString();


        //==============================================
        //第二種寫法，Allen Kuo的文章 
        // http://www.allenkuo.com/EBook5/view.aspx?a=1&TreeNodeID=123&id=978 
        int a = 100;
        int b = 23;

        LongLongVariable = (a + b).ToString();

        Label1.Text = LongLongVariable; 
    }


    //***************************************************************************
    //** Property，詳見Allen Kuo文章  
    //** http://www.allenkuo.com/EBook5/view.aspx?a=1&TreeNodeID=123&id=969
    String YourKey = "ComputeResult";
    private String LongLongVariable
    {
        get {
            if (Session[YourKey] == null)
            {
                Session[YourKey] = 0;
                Response.Write("<h3>Session不可以是null</h3>");
            }
            return Session[YourKey].ToString();
        }

        set { // 寫一段簡單的 if判別式，避免啟始值有錯。
            Session[YourKey] = value;  // value是一個關鍵字。
        }

    }

}