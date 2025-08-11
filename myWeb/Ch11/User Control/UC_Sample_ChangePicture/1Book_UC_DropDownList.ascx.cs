using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_UC : System.Web.UI.UserControl
{
    //========================================
    //=== 改成字串型態！ ===========================
    //[System.ComponentModel.Browsable(true)]   
    // http://msdn.microsoft.com/zh-tw/library/system.componentmodel.browsableattribute(v=vs.110).aspx?cs-save-lang=1&cs-lang=csharp#code-snippet-2


    //唯讀屬性（ReadOnly。C#只有set沒有get，就是唯讀）
    public String DisplayBook
    {
        set
        {
           Panel PL = (Panel)FindControl(value);
           if (PL.ID == "CSPanel")
           {
               CSPanel.Visible = true;
               VBPanel.Visible = false;
           }
           else
           {
               CSPanel.Visible = false;
               VBPanel.Visible = true;
           }
        }
    }


    //=======================================

    protected void Page_Load(object sender, EventArgs e)
    {
        //**************************
        //****** 保持空白！！ ******
        //**************************
    }
}