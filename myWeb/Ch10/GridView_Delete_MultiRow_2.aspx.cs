using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Delete_MultiRow_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["Page"] = "0";   // 第一次執行頁面，一定在第一頁。
            Session["delete_ID"] = "-1";   // Session[]如果沒有預設值的話，會出現錯誤。
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        for (int i=0; i<GridView1.Rows.Count;i++)
        {
            CheckBox myCheckbox= (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            Label myID= (Label)GridView1.Rows[i].FindControl("Label1");

            if (myCheckbox.Checked == true)
            {
                //====================
                //==  被點選的某一筆資料。 ==
                //====================

                if (Session["delete_ID"].ToString() == "-1")  {
                    //-- 使用者點選某一筆資料後，原本的預設值 Session("delete_ID") = "-1" 就要取消。
                    Session["delete_ID"] = "";
                }

                //註解：VB語法的 Instr()，在C#裡面改為 .IndexOf("字串", 0)
                //    找不到的話， 會傳回「-1」。
                //    找到的話，回傳一個Integer數字（從零算起）。表示在字串裡面第幾個字，符合條件。
                //  請看 http://www.dotblogs.com.tw/mis2000lab/archive/2009/01/14/instr_function_090114.aspx
                if (Session["delete_ID"].ToString().IndexOf(myID.Text, 0) == -1)  {
                    //-- 檢查一下，如果相同的文章編號已經記錄在 Session()了，就不要重複記憶！
                    Session["delete_ID"] = Session["delete_ID"].ToString() + myID.Text + "，";
                }

            }
            else {
                //======================================================
                //== 「沒有」被點選的某一筆資料。 必須從 Session()裡面刪除（以空字串代替）==
                //======================================================

                if (Session["delete_ID"].ToString() != "-1")  {
                    if (Session["delete_ID"].ToString().IndexOf(myID.Text, 0) >= 0)  {
                        String replace_str = myID.Text + "，";
                        Session["delete_ID"] = Session["delete_ID"].ToString().Replace(replace_str, "");
                     }
                }

            }   // if -- End
        }  // for loop -- End


        if (Session["delete_ID"] == "-1")        {
            Label2.Text = "您尚未點選任何一筆資料（沒有刪除任何一筆）"; }  
        else  {
            Label2.Text = Session["delete_ID"].ToString(); 
        }
            
    }
}