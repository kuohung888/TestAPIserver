using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Delete_MultiRow_5_Page : System.Web.UI.Page
{
    String non_Record = "-1";

    //================================================(start)
    //== 以重構的手法，將程式裡面重複使用的 Session變成一個 Property
    //================================================
    //== 優點：避免 Session的變數寫錯字而不自知。
    //== 以後要更換成 Cookie或是 ViewState也容易
    public String WantToDelete_ID
    {
        get  {
            if (Session["delete_ID"] == null)
                return "";
            else
                return Session["delete_ID"].ToString();
        }
        set { Session["delete_ID"] = value; }
    }
    //================================================(end)


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            // 第一次執行，清空所有要刪除的ID值。
            WantToDelete_ID = non_Record;   //-- Session 如果沒有預設值的話，會出現錯誤。
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Checkbox_Process();
        //== 重複的、大量的程式，就抽離出去，獨自成為一個函數、副程式。
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        //== 在此不用作 DataBinding。
        //      因為HTML畫面裡面， GridView已經有設定 DataSourceID。
    }


    //**** 請看上集，第十一章 *******************************************
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //-- 參考資料： [習題]GridView樣版內部，改用CheckBox/Radio/DropDownList（單/複選）控制項，取代TextBox
        //-- 請看我的BLOG與習題 -- http://www.dotblogs.com.tw/mis2000lab/archive/2008/12/26/gridview_template_radiobuttonlist_1225.aspx

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox myCheckbox = (CheckBox)e.Row.FindControl("CheckBox1");
            Label myID = (Label)e.Row.FindControl("Label1");

            //*** 方法一 ****************************************************************
            String myID_no_str2 = "A" + myID.Text + "，";  //-- 幫ID編號加上一個A字首

            if (WantToDelete_ID.IndexOf(myID_no_str2, 0) >= 0)
                //-- 檢查一下，如果文章編號已經記錄在 Session裡面了，那麼 CheckBox就要被勾選。
                myCheckbox.Checked = true;
            else
                myCheckbox.Checked = false;

            //*** 方法二 ****************************************************************
            //*** 把字串（A1,A2,A3.....）改用 .Split()方法轉成陣列會更好，例如 String[] 陣列名稱 = myID_no_str.Split(",")
            //*** 就可以不用在數字前面加上「A」了！
            //*** http://msdn.microsoft.com/zh-tw/library/b873y76a(v=vs.110).aspx
        }
    }



     //******** 自訂的副程式與函數 **********************************************
    void Checkbox_Process()
    {
        for(int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox myCheckbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
            String myID_no_str1 = "A" + myID.Text;  //--幫ID編號加上一個A字首
            //*** 把字串（A1,A2,A3.....）改用 .Split()方法轉成陣列會更好，例如 String[] 陣列名稱 = myID_no_str.Split(",")
            //*** 就可以不用在數字前面加上「A」了！
            //*** http://msdn.microsoft.com/zh-tw/library/b873y76a(v=vs.110).aspx

            if (myCheckbox.Checked)
            {   //====================
                //==  被點選的某一筆記錄。 ==
                //====================
                WantToDelete_ID_Add(myID_no_str1);   //== 加入「您想刪除的ID字串」裡面。
            }
            else
            {   //=================================================
                //== 「沒有」被點選的某一筆記錄。 必須從 Session裡面刪除（以空字串代替）==
                //=================================================
                WantToDelete_ID_Remove(myID_no_str1);  //== 從「您想刪除的ID字串」裡面，移除這筆ID。
            }
        }

        if (WantToDelete_ID == non_Record)
            Label2.Text = "您尚未點選任何一筆資料（沒有刪除任何一筆）";
        else
            Label2.Text =WantToDelete_ID.Replace("A", "");
            //== 您可以使用這些文章的ID來進行SQL指令「刪除」的動作 ==
    }


    //== 加入「您想刪除的ID字串」裡面。
    void WantToDelete_ID_Add(String myID_no_str)
    {
        if (WantToDelete_ID == non_Record)
        {    //-- 使用者點選某一筆記錄後，原本的預設值 delete_ID = "-1" 就要取消。
            WantToDelete_ID = "";
        }
            //註解：VB語法的 Instr()，在C#裡面改為 .IndexOf("字串", 0)
            //    找不到的話， 會傳回「-1」。
            //    找到的話，回傳一個Integer數字（從零算起）。表示在字串裡面第幾個字，符合條件。
            //  請看 http://www.dotblogs.com.tw/mis2000lab/archive/2009/01/14/instr_function_090114.aspx

            if (WantToDelete_ID.IndexOf(myID_no_str, 0) == -1)
            {    //-- 檢查一下，新增的文章編號，才加入。
                //-- 如果相同的文章編號已經記錄在 Session()了，就不要重複記憶！
                WantToDelete_ID = WantToDelete_ID + myID_no_str + "，";
            }

    }


    //== 從「您想刪除的ID字串」裡面，移除這筆ID。
    void WantToDelete_ID_Remove(String myID_no_str)
    {
        if (WantToDelete_ID != non_Record)   //--已經有資料在內
        {
            if (WantToDelete_ID.IndexOf(myID_no_str, 0) >= 0)    {
                String replace_str = myID_no_str + "，";
                WantToDelete_ID = WantToDelete_ID.Replace(replace_str, "");
            }
        }
    }

}