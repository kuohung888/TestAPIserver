using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_0_Easy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {   //== 右移 ==
        int a = 0;

        if (ListBox1.Items.Count == 0)
            Response.Write("<Script Language=\"JavaScript\">window.alert(\"警告！ListBox1已經沒有子選項\");</Script>");

        //**********************************************************
        //*** 改用反迴圈（由大到小）來執行，即可。
        //**********************************************************
        for (int i = (ListBox1.Items.Count - 1); i >= 0; i--)
        {
            if (ListBox1.Items[i].Selected)
            {
                ListBox2.Items.Add(ListBox1.Items[i]);
                a++;

                ListBox1.Items.Remove(ListBox1.Items[i]);
                //==被搬移走了，這個子選項就該移除！
            }
        }


        if (a == 0)
        {
            Label1.Text = "<font color=red>警告！您未點選任何一個子選項</font>";
        }
        else
        {
            Label1.Text = "<font color=blue>移動成功</font>";
        }
        Label2.Text = "";
    }


    protected void Button2_Click(object sender, EventArgs e)
    {   //== 左移 ==
        int b = 0;

        if (ListBox2.Items.Count == 0)
            Response.Write("<Script Language=\"JavaScript\">window.alert(\"警告！ListBox2已經沒有子選項\");</Script>");

        //**********************************************************
        //*** 改用反迴圈（由大到小）來執行，即可。
        //**********************************************************
        for (int j = (ListBox2.Items.Count - 1); j >= 0; j--)
        {
            if (ListBox2.Items[j].Selected)
            {
                ListBox1.Items.Add(ListBox2.Items[j]);
                b++;

                ListBox2.Items.Remove(ListBox2.Items[j]);
                //==被搬移走了，這個子選項就該移除！
            }
        }


        if (b == 0)
        {
            Label2.Text = "<font color=red>警告！您未點選任何一個子選項</font>";
        }
        else
        {
            Label2.Text = "<font color=green>移動成功</font>";
        }
        Label1.Text = "";
    }
}