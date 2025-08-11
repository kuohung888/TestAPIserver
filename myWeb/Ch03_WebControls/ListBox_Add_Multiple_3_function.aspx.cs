using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_3_function : System.Web.UI.Page
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
        MoveItem(ListBox1);
    }


    protected void Button2_Click(object sender, EventArgs e)
    {   //== 左移 ==
        MoveItem(ListBox2);
    }


    //***********************************************************
    protected void MoveItem(ListBox myListBox)
    {
        int a = 0;
        String[] ItemA = new String[myListBox.Items.Count];   //-- 陣列

        if (myListBox.Items.Count == 0)
        {
            Response.Write("<Script Language=\"JavaScript\">window.alert(\"警告！" + myListBox.ID + "已經沒有子選項\");</Script>");
            return;
        }

        for (int i = 0; i < myListBox.Items.Count; i++)
        {
            if (myListBox.Items[i].Selected)
            {
                if (myListBox.ID == "ListBox1")
                {
                    ListBox2.Items.Add(ListBox1.Items[i].Text);
                }
                else
                {
                    ListBox1.Items.Add(ListBox2.Items[i].Text);
                }
                
                ItemA[a] = myListBox.Items[i].Text;  //==把要移除的子項目，先暫存在陣列裡面。
                a = a + 1;
            }
        }
        //== 批次刪除 子項目 =======================(start)
        for (int K = 0; K < a; K++)
        {
            myListBox.Items.Remove(ItemA[K]);
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
    }
}