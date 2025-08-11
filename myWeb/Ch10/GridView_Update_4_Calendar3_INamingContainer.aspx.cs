using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_4_Calendar3_INamingContainer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    //******完全不需要用到這個事件！！******************************
    //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    Session["RowIndex"] = e.NewEditIndex;
    //}

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {                
        Calendar CA = (Calendar)sender;   //***重點！！***

        TextBox TB = (TextBox)CA.FindControl("TextBox1");     
        //***重點！！***因為這兩者都被 GridViewRow包含在一起
        // http://msdn.microsoft.com/zh-tw/library/system.web.ui.inamingcontainer(v=vs.110).aspx
        
        TB.Text = CA.SelectedDate.ToShortDateString();

        //***** Allen Kuo的說明 ******************
        // 以你的狀況,Calender,textbox都被包在同一個GridViewRow裡
        // 因此, 若用了CA.FindControl()時
        // 由於CA沒有實作INamingContainer,因此, 會叫用 CA的NamingContainer(也就是GridViewRow)

        // 你平時也可以試試看,
        // 若寫TextBox1.FindControl("Button1")也會找得到,
        // 原因相同,因為TextBox1沒實作INamingContainer所以它其實是委託Page去找Button1

        //**************************************
        // 我的補充範例（關於NamingContainer的用法）：
        // http://www.dotblogs.com.tw/mis2000lab/archive/2012/11/23/gridview_inside_dropdownlist_namincontainer_20121122.aspx
        // http://www.dotblogs.com.tw/mis2000lab/archive/2011/09/08/gridview_selectedindex_dataitemindex_rowcommand_2011.aspx
    }
}