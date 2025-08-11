using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15_test_Parent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //請參考「跨網頁張貼」的第二種作法！
        if (this.PreviousPage != null) 
        {
                if (PreviousPage.IsCrossPagePostBack == true) 
                {
                     Label1.Text = PreviousPage.myTextBox;
                }
        }

        string str = @"<script> 
                            function OpenPopupWindow()
                            {
                                window.open('2_Popup.aspx',null,'left=300, top=100, height=500, width= 400, status=no, resizable=no, scrollbars=no, toolbar=no,location=no, menubar=no');
                            }
                            </script>"; 
        
        // register the javascript into the Page
        ClientScript.RegisterClientScriptBlock(this.GetType(), "自己取名即可", str); 
         
        //add our popup onclick attribute to the desired element on the page (Here, Hyperlink1)
                LinkButton1.Attributes.Add("onClick", "OpenPopupWindow()");
                LinkButton1.Attributes.Add("onMouseOver", "this.style.cursor='hand';"); 
    }

}