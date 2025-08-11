using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl_05_Event_OK : System.Web.UI.UserControl
{
    //=======================================================
    //== 委派兩個事件。 ==
    //== http://msdn.microsoft.com/zh-tw/library/17sde2xt(v=vs.80).aspx
    //==    如此一來，ASP.NET網頁引用這個UC的時候，就能使用這個UC的兩個事件。
    //=======================================================

    public delegate void  mis2000lab_EditRecordHandler(object sender, mis2000lab_EventArgs e);  //** 第二個參數，修正過！
    //==  delegate 關鍵字會告訴編譯器 AlarmEventHandler 是個委派型別。
    //== 依照慣例，.NET Framework 中的事件委派有兩個參數，引發事件的來源和事件的資料。
    //==  許多事件 (包括像按一下滑鼠這類使用者介面事件) 不會產生事件資料。在這類情況下，類別庫 (Class Library) 中對無資料事件提供的事件委派 System.EventHandler 是適當的。
    public event mis2000lab_EditRecordHandler mis2000lab_EditRecord;   //--事件(1)，後面可以自己命名，但通常跟Handler同名


    protected virtual void Onmis2000lab_EditRecord(mis2000lab_EventArgs e)     //** 第二個參數，修正過！
    {   //--寫在 .aspx網頁上，被觸發的「方法(1)」！
        if (mis2000lab_EditRecord != null)  {
            mis2000lab_EditRecord(this, e);   //--觸發此OnEditRecord「方法」，會執行 mis2000lab_EditRecord事件！
            // 請注意，C# 程式碼在引發事件之前，應該先檢查事件是否為 null。VB不需要。 
            // 這樣可以避免因為引發未附加任何事件處理常式的事件，而必須處理擲回的 NullReferenceException。
        }
        //-- Q :  為什麼要設定這段if判別式呢？
        //-- A :   如果不判斷是否為null，一旦網頁（.aspx）加入這個UC卻沒使用他的事件，就會報錯！
        //            您在畫面上拉入一個Button，不寫他的Click事件就會報錯，這種程式不是很怪嗎？
    }

    //=======================================================
    //== 實作具有事件特定資料的事件
    //== 請參閱 http://msdn.microsoft.com/zh-tw/library/5z57dxz2(v=vs.80).aspx

    //*********************************
    //**  自訂EventArgs ***************
    //*********************************
    public class mis2000lab_EventArgs : EventArgs
    {
        private string m_TestString = "<font color=red>UC裡面的預設值！</font>";

        public string TestString
        {
            get { return m_TestString; }
        }

        public mis2000lab_EventArgs(string m_TestString)
        {   //--與 Class同名。
            //-- 類似VB語法 Class 的 Sub New()
            this.m_TestString = TestString;
        }
    }
    
    
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        //**********************************
        mis2000lab_EventArgs cre = new mis2000lab_EventArgs("<font color=darkgreen>UC裡面的 GridView1_RowEditing事件</font>");

        Onmis2000lab_EditRecord(cre);   //** 重點！！ **
        //** 引發此事件。 呼叫 「On事件名稱」 這個方法，來引發事件。
        //** 請參閱 http://msdn.microsoft.com/zh-tw/library/5z57dxz2(v=vs.80).aspx
    }
}