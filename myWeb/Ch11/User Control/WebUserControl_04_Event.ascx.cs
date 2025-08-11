using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl_04_Event : System.Web.UI.UserControl
{

    //=======================================================
    //== 委派兩個事件。 ==
    //== http://msdn.microsoft.com/zh-tw/library/17sde2xt(v=vs.80).aspx
    //==    如此一來，ASP.NET網頁引用這個UC的時候，就能使用這個UC的兩個事件。
    //=======================================================
    public delegate void mis2000lab_EditRecordHandler();
    //==  Delegate 關鍵字會告訴編譯器 AlarmEventHandler 是個委派型別。
    //== 依照慣例，.NET Framework 中的事件委派有 "兩個"參數，引發事件的來源 (object)和事件的資料 (e)。
    //== 許多事件 (包括像按一下滑鼠這類使用者介面事件) 不會產生事件資料。
    //== 在這類情況下，類別庫 (Class Library) 中對無資料事件提供的事件委派 System.EventHandler 是適當的。  
    public event mis2000lab_EditRecordHandler mis2000lab_EditRecord;   //--事件(1)，後面可以自己命名，但通常跟Handler同名


    public delegate void mis2000lab_FinishedEditRecordHandler();
    public event mis2000lab_FinishedEditRecordHandler mis2000lab_FinishedEditRecord;   //--事件(2)，後面可以自己命名，但通常跟Handler同名


    
    //** 引發此事件。 呼叫 「On事件名稱」這個方法 來引發事件。
    protected virtual void Onmis2000lab_EditRecord()   //--寫在 .aspx網頁上，被觸發的「Onmis2000lab_EditRecord方法」！
    {
        if (mis2000lab_EditRecord != null)
        {
            mis2000lab_EditRecord();
            //--觸發此Onmis2000lab_EditRecord「方法」，會執行 mis2000lab_EditRecord事件！
        }
        //-- Q :  為什麼要設定這段if判別式呢？
        //-- A :   如果不判斷是否為null，一旦網頁（.aspx）加入這個UC卻沒使用他的事件，就會報錯！
        //            您在畫面上拉入一個Button，不寫他的Click事件就會報錯，這種程式不是很怪嗎？
    }

    protected virtual void Onmis2000lab_FinishedEditRecord()   //--寫在 .aspx網頁上，被觸發的「Onmis2000lab_FinishedEditRecord方法」！
    {
        if (mis2000lab_FinishedEditRecord != null)
        {
            mis2000lab_FinishedEditRecord();
            //--觸發此Onmis2000lab_FinishedEditRecord「方法」，會執行 mis2000lab_FinishedEditRecord事件！
        }
        //-- Q :  為什麼要設定這段if判別式呢？
        //-- A :   如果不判斷是否為null，一旦網頁（.aspx）加入這個UC卻沒使用他的事件，就會報錯！
        //            您在畫面上拉入一個Button，不寫他的Click事件就會報錯，這種程式不是很怪嗎？
    }
    //=======================================================



    protected void Page_Load(object sender, EventArgs e)
    {

    }
}