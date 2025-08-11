using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Delete_MultiRow_3_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["delete_ID"] = "-1";   // Session[]如果沒有預設值的話，會出現錯誤。
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox myCheckbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            Label myID = (Label)GridView1.Rows[i].FindControl("Label1");

            if (myCheckbox.Checked == true)
            {
                //====================
                //==  被點選的某一筆資料。 ==
                //====================

                if (Session["delete_ID"].ToString() == "-1")
                {
                    //-- 使用者點選某一筆資料後，原本的預設值 Session("delete_ID") = "-1" 就要取消。
                    Session["delete_ID"] = "";
                }

                //註解：VB語法的 Instr()，在C#裡面改為 .IndexOf("字串", 0)
                //    找不到的話， 會傳回「-1」。
                //    找到的話，回傳一個Integer數字（從零算起）。表示在字串裡面第幾個字，符合條件。
                //  請看 http://www.dotblogs.com.tw/mis2000lab/archive/2009/01/14/instr_function_090114.aspx
                if (Session["delete_ID"].ToString().IndexOf(myID.Text, 0) == -1)
                {
                    //-- 檢查一下，如果相同的文章編號已經記錄在 Session()了，就不要重複記憶！
                    Session["delete_ID"] = Session["delete_ID"].ToString() + myID.Text + "，";
                }

            }
            else
            {
                //======================================================
                //== 「沒有」被點選的某一筆資料。 必須從 Session()裡面刪除（以空字串代替）==
                //======================================================

                if (Session["delete_ID"].ToString() != "-1")
                {
                    if (Session["delete_ID"].ToString().IndexOf(myID.Text, 0) >= 0)
                    {
                        String replace_str = myID.Text + "，";
                        Session["delete_ID"] = Session["delete_ID"].ToString().Replace(replace_str, "");
                    }
                }

            }   // if -- End
        }  // for loop -- End


        if (Session["delete_ID"] == "-1")
        {
            Label2.Text = "您尚未點選任何一筆資料（沒有刪除任何一筆）";
        }
        else
        {
            Label2.Text = Session["delete_ID"].ToString();
        }
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        //== 在此不用作 DataBinding。
        //      因為HTML畫面裡面， GridView已經有設定 DataSourceID。
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //-- 參考資料： [習題]GridView樣版內部，改用CheckBox/Radio/DropDownList（單/複選）控制項，取代TextBox
        //-- 請看我的BLOG與習題 -- http://www.dotblogs.com.tw/mis2000lab/archive/2008/12/26/gridview_template_radiobuttonlist_1225.aspx

        CheckBox myCheckbox = (CheckBox)e.Row.FindControl("CheckBox1");
        Label myID = (Label)e.Row.FindControl("Label1");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            //註解：VB語法的 Instr()，在C#裡面改為 .IndexOf("字串", 0)
            //    找不到的話， 會傳回「-1」。
            //    找到的話，回傳一個Integer數字（從零算起）。表示在字串裡面第幾個字，符合條件。
            if (Session["delete_ID"].ToString().IndexOf(myID.Text, 0) >= 0)
            {
                //-- 檢查一下，如果文章編號已經記錄在 del_no()陣列裡面了，那麼 CheckBox就要被勾選。
                myCheckbox.Checked = true;  }
            else  {
                myCheckbox.Checked = false;
            }
        }

    }
}