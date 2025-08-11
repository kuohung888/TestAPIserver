using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_textbox02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtNum1.Text=="" || txtNum2.Text=="" || txtNum3.Text=="")
            {
                lblSum.Text="計算欄位不能為空";
            }
            else
            {

                int sum = Convert.ToInt32(txtNum1.Text)+ Convert.ToInt32(txtNum2.Text)- Convert.ToInt32(txtNum3.Text);
                lblSum.Text = String.Format("{0:C}", sum);

            }

        }
        catch (Exception)
        {
            
            lblSum.Text="計算欄位格式必須是數字";
        }



    }
}