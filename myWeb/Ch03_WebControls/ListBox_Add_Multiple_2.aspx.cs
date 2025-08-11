using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_2 : System.Web.UI.Page
{

    //========================================
    //== 這兩個事件的程式，非常雷同。您可以彙整起來，
    //== 改寫成一個 Sub副程式或是 Function，讓大家重複呼叫「這些類似的程式碼」。
    //========================================
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {   //== 右移 ==
        int a = 0;
        String[] ItemA = new String[ListBox1.Items.Count];   //-- 陣列

        if (ListBox1.Items.Count == 0)
        {
            Label1.Text = "<font color=red>警告！ListBox1已經沒有子選項</font>";
            return;
        }

        for (int i = 0; i < ListBox1.Items.Count; i++)
        {
            if (ListBox1.Items[i].Selected)
            {
                ListBox2.Items.Add(ListBox1.Items[i].Text);

                ItemA[a] = ListBox1.Items[i].Text;  //==把要移除的子項目，先暫存在陣列裡面。
                a = a + 1;
            }
        }
        //== 批次刪除 子項目 =======================(start)
        for (int K = 0; K < a; K++)
        {
            ListBox1.Items.Remove(ItemA[K]);
            //==被搬移走了，這個子選項就該移除！
        }   //==================================(end)

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
        String[] ItemB = new String[ListBox2.Items.Count];   //-- 陣列

        if (ListBox2.Items.Count == 0)
        {
            Label2.Text = "<font color=red>警告！ListBox2已經沒有子選項</font>";
            return;
        }

        for (int j = 0; j < ListBox2.Items.Count; j++)
        {
            if (ListBox2.Items[j].Selected)
            {
                ListBox1.Items.Add(ListBox2.Items[j].Text);

                ItemB[b] = ListBox2.Items[j].Text;  //==把要移除的子項目，先暫存在陣列裡面。
                b = b + 1;
            }
        }
        //== 批次刪除 子項目 =======================(start)
        for (int k = 0; k < b; k++)
        {
            ListBox2.Items.Remove(ItemB[k]);
            //==被搬移走了，這個子選項就該移除！
        }   //==================================(end)

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