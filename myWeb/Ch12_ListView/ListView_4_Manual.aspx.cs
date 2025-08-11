using System;
using System.Collections;   //--自己寫的。 DictionaryEntry會用到
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch12_ListView_ListView_4_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //====================================================
    //== 刪除 =====
    //====================================================
    protected void Button1_Delete_Click(object sender, EventArgs e)
    {
        if (ListView1.SelectedIndex >= 0)
        {
            ListView1.DeleteItem(ListView1.SelectedIndex);
            //== 使用 DeleteItem 方法，以程式設計的方式刪除資料來源中指定索引的資料錄。
            //== 這個方法通常用於從 ListView 控制項之外刪除資料錄，例如從頁面上的另一個控制項。
            //== 這個方法會引發 ItemDeleted 和 ItemDeleting 事件。 
            //--參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listview.deleteitem.aspx
            Label1.Text = "******刪除成功！！******";
        }
        else
        {
            Label1.Text = "您尚未選定任何一筆資料";
        }
    }


    //== 刪除之後（必須搭配 SqlDataSource才行），有無出現例外狀況？==
    protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
    {
        // Check if an exception occurred to display an error message.
        if (e.Exception != null) 
        {
             Label1.Text = "發生例外狀況....";
            e.ExceptionHandled = true;
        }
        else
        {
            ListView1.SelectedIndex = -1;   //-- 「未」選定任何一筆資料
        }
    }


    //====================================================
    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //--當頁面屬性變更時，但是在 ListView 控制項使用 SetPageProperties 方法設定新的值之前會引發 PagePropertiesChanging 事件。
        //--這可讓您在每次發生這個事件時執行自訂常式，例如清除 SelectedIndex 或 EditIndex 屬性。 
        //--參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listview.onpagepropertieschanging.aspx

        ListView1.SelectedIndex = -1;  //-- 「未」選定任何一筆資料
        ListView1.EditIndex = -1;
        
        Button1_Delete.Visible = true;
        Button3_Update.Visible = false;
    }


    //***********************************************************************************
    //*** 進入「編輯」模式 ***
    //***********************************************************************************
    protected void Button2_Edit_Click(object sender, EventArgs e)
    {
        if (ListView1.SelectedIndex >= 0) 
        {
            //== 進入「編輯」模式！==
            ListView1.EditIndex = ListView1.SelectedIndex;
            Button1_Delete.Visible = false;   //--進入編輯模式，把「刪除」按鈕給隱藏起來
            Button3_Update.Visible = true;
        }
        else
        {
            Label1.Text = "您尚未選定任何一筆資料";
        }
    }


    //***********************************************************************************
    //*** 更 新 ***
    //***********************************************************************************
    protected void Button3_Update_Click(object sender, EventArgs e)
    {
        if (ListView1.SelectedIndex >= 0)
        {
            //== 更新這一筆資料！==
            ListView1.UpdateItem(ListView1.SelectedIndex, false);
            //--參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listview.updateitem.aspx
        }
        else
        {
            Label1.Text = "您尚未選定任何一筆資料";
        }
        Button1_Delete.Visible = true;
    }


    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        //--參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listview.itemupdating.aspx

        foreach (DictionaryEntry de in e.NewValues)   //-- DictionaryEntry需要用到 System.Collections命名空間
        {
            //-- 透過For迴圈逐一檢查，如果發現有任何一個欄位的內容是空白，這次的資料更新就會自動取消！
            if (de.Value == null || de.Value.ToString().Trim().Length == 0)
            {
                Label1.Text = "有欄位是空白的，所以暫停這次的資料更新！";
                e.Cancel = true;
            }
        }

    }


    //***********************************************************************************
    //*** 新增一筆資料 ***
    //***********************************************************************************
    protected void Button4_Insert_Click(object sender, EventArgs e)
    {
        //--參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listview.insertnewitem.aspx
        ListView1.InsertNewItem(true);
        Button1_Delete.Visible = true;
    }


    protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
    {
        if (e.Exception != null) 
        {
            if (e.AffectedRows == 0)   //-- AffectedRows = 0表示新增失敗！
            {
                e.KeepInInsertMode = true;
                Label1.Text = "新增資料失敗，出現例外狀況";
            }
            else
            {
                Label1.Text = "新增資料失敗，出現例外狀況";
            }
              
            e.ExceptionHandled = true;
        }         

    }

}