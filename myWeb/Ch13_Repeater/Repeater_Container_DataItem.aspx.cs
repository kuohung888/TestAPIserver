using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//===================
using System.Collections;    //==ArrayList需要用到！


public partial class Book_Sample_Ch12_ListView_Repeater_Container_DataItem : System.Web.UI.Page
{

    //===============
    ArrayList list;
    //===============


    protected void Page_Load(object sender, EventArgs e)
    {
        list = new ArrayList();

        list.Add("One");
        list.Add("Two");
        list.Add("Three");

        Repeater1.DataSource = list;
        Repeater1.DataBind();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- 使用 .FindControl()方法，在 Repeater控制項的第一個項目中搜尋名為 Message 的控制項，
        //-- 然後判斷該控制項的 NamingContainer 物件。程式碼接著判斷首次呼叫 NamingContainer 屬性
        //-- 所傳回控制項的命名容器，並且繼續在控制項樹狀結構中執行這個動作，直到找到沒有命名容器的控制項為止 
        //-- (WalkContainers 方法也會在最底層加入控制項型別，其本身不是命名容器)。

         Control x = Repeater1.Items[0].FindControl("Message");

        if (x != null)
        {
            list = WalkContainers(x);
        }

        Repeater1.DataSource = list;
        Repeater1.DataBind();
    }


    private ArrayList WalkContainers(Control ctl)
    {
        ArrayList ret = new ArrayList();
        Control parent = ctl.NamingContainer;
        if (parent != null)
        {
            ArrayList sublist = WalkContainers(parent);
            for (int j = 0; j < sublist.Count; j++) ret.Add(sublist[j]);
        }
        ret.Add(ctl.GetType().Name);
        return ret;
    }

}