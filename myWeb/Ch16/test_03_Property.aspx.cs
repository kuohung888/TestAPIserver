using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_test_03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //-- 兩種作法任選其一
            //Session["i"] = 0;
            //Response.Write("<font color=blue>i = " + Session["i"].ToString() + "</font><br />");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Session["i"] = Convert.ToInt32(Session["i"]) + 1;
        //Response.Write("Session[\"i\"] = " + Session["i"].ToString() + "<br />");

        HitNo++;   //*** 改用「屬性」來作

        Response.Write(HitNo);
    }

    //********************************************************
    //*** 盡量不把 Session與 ViewState寫在程式碼裡面，以後難改！
    private String SessionKey = "ABCDEFGHIJKLMNOP";

    public int HitNo
    {
        get
        {
            if (Session[SessionKey] == null)
                Session[SessionKey] =0;

            return Convert.ToInt32(Session[SessionKey]);
        }
        set
        {
            Session[SessionKey] = value;
        }
    }
}