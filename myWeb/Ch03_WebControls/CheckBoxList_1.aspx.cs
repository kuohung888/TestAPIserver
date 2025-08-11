using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch03_WebControls_CheckBoxList_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int u_summary = 0;  //統計「總得分」。

        for(int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                Label1.Text = "";
                if (CheckBoxList1.Items[i].Value != "0")
                {
                    Label1.Text = "<font color=\"darkgreen\">答對！</font>";
                    u_summary += Convert.ToInt32(CheckBoxList1.Items[i].Value);
                }
                else  {
                    Label1.Text = "<font color=\"red\">有錯誤喔～</font>";
                    break;    // 遇見錯誤就跳離迴圈。 
                }
                
            }
        }

        //----------------------------------------------------------------------------
        
        for (int j = 0; j<CheckBoxList2.Items.Count; j++)
        {
            if (CheckBoxList2.Items[j].Selected)
            {
                Label2.Text = "";
                if (CheckBoxList2.Items[j].Value != "0")  {
                    Label2.Text = "<font color=\"darkgreen\">答對！</font>";
                    u_summary += Convert.ToInt32(CheckBoxList2.Items[j].Value);
                }
                else  {
                    Label2.Text = "<font color=\"red\">有錯誤喔～</font>";
                    break;    // 遇見錯誤就跳離迴圈。
                }
            }            
        }


        //----------------------------------------------------------------------------
        //-- 這個題目裡面，必須複選兩個才算正確 --
        
        int u_summary_3 = 0;

        for (int k = 0; k < CheckBoxList3.Items.Count; k++)
        {
            if (CheckBoxList3.Items[k].Selected)
            {
                Label3.Text = "";
                if (CheckBoxList3.Items[k].Value != "0")
                {
                    u_summary_3 += Convert.ToInt32(CheckBoxList3.Items[k].Value);
                }
                else  {
                    Label3.Text = "<font color=\"red\">有錯誤喔～</font>";

                    //**************************************************
                    u_summary_3 = 0;  //-- 有錯誤選項，立刻把分數歸零！2011/12/19修正。
                    //**************************************************
                    break;    // 遇見錯誤就跳離迴圈。
                }
            }            
        }   // end of  For Loop


        if (u_summary_3 == 6)   {
            Label3.Text += "<font color=\"darkgreen\">答對！</font>";
        }
        else   {
            //必須複選兩個選項才算對，如果只選到對的其中一個，也算錯！
            Label3.Text = "<font color=\"red\">有錯誤喔～</font>";
        }

        u_summary += Convert.ToInt32(u_summary_3);

        //----------------------------------------------------------------------------
        Label_summary.Text = u_summary.ToString();
    }


    //資料來源：http://www.csharphelp.com/archives4/archive616.html
    public static string Left(string param, int length)
    {
            //we start at 0 since we want to get the characters starting from the
            //left and with the specified lenght and assign it to a variable
            string result = param.Substring(0, length);
            //return the result of the operation
            return result;
    } 

}
