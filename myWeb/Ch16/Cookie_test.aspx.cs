using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_Cookie_test : System.Web.UI.Page
{
         protected void Page_Load(object sender, EventArgs e)
            {
                if (!Page.IsPostBack)
                {
                    //--寫入 Cookie
                     Response.Cookies["test"].Value = "MIS2000 Lab.";
                     Response.Cookies["test"].Expires = DateTime.Now.AddDays(10);

                     Response.Write("Cookie的內容 ----" + Request.Cookies["test"].Value);   //--讀取Cookie
                     Label1.Text = Server.HtmlEncode(Request.Cookies["test"].Value);
                }
            }

         protected void Button1_Click(object sender, EventArgs e)
         {
             if (Request.Cookies["test"] != null)   //--讀取Cookie
             {
                 Label2.Text = "Button1_Click事件的 -- " + Server.HtmlEncode(Request.Cookies["test"].Value);
             }
         }

}