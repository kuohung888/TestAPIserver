using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_4_function_ListItem : System.Web.UI.Page
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
        MoveItem(ListBox1, ListBox2);
    }


    protected void Button2_Click(object sender, EventArgs e)
    {   //== 左移 ==
        MoveItem(ListBox2, ListBox1);
    }


    //***********************************************************
    //*** 從哪個 ListBox（LB_A）移動到另外一個 ListBox（LB_B）
    protected void MoveItem(ListBox LB_A, ListBox LB_B)
    {
        int a = 0;
        //-------------------------------------------------------
        List<ListItem> myList = new List<ListItem>();  //-- 改用 List<T>取代原本的陣列
        //-------------------------------------------------------

        if (LB_A.Items.Count == 0)
        {
            Response.Write("<Script Language=\"JavaScript\">window.alert(\"警告！" + LB_A.ID + "已經沒有子選項\");</Script>");
            return;
        }

        for (int i = 0; i < LB_A.Items.Count; i++)
        {
            if (LB_A.Items[i].Selected)
            {
                   LB_B.Items.Add(LB_A.Items[i]);
                   //-- .Add()方法，在此是加入一個「子選項(ListItem)」，而非上一個範例的「字串」。
                        
                   //-------------------------------------------------------
                   myList.Add(LB_A.Items[i]);  //==把要移除的子項目，先暫存在 List<T>裡面。
                   //-------------------------------------------------------
                    a = a + 1;
            }
        }
        //== 批次刪除 子項目 =======================(start)
        for (int K = 0; K < myList.Count; K++)
        {
            LB_A.Items.Remove(myList[K]);
            //==被搬移走了，這個子選項就該移除！
        }   //==================================(end)

        if (a == 0)
        {
            Response.Write("<Script Language=\"JavaScript\">window.alert(\"警告！您未點選" + LB_A.ID + "任何一個子選項\");</Script>");
        }
        else
        {
            Response.Write("<Script Language=\"JavaScript\">window.alert(\"移動成功\");</Script>");
        }
    }
}