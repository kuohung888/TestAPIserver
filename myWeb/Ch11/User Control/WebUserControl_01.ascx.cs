using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_User_Control_WebUserControl_01 : System.Web.UI.UserControl
{
    //== 預設值 ==
    private Boolean m_AllowPaging = true;

    //==公開屬性 == http://msdn.microsoft.com/zh-tw/library/x9fsa0sw.aspx
    //[System.ComponentModel.Browsable(true)]   // http://msdn.microsoft.com/zh-tw/library/system.componentmodel.browsableattribute(v=vs.110).aspx?cs-save-lang=1&cs-lang=csharp#code-snippet-2
    public Boolean YesOrNo_AllowPaging
    {
        get { return m_AllowPaging; }    //--只傳回 true或 false。
        // get使用 return，將「值」傳回給呼叫這個屬性的程式。

        set  { m_AllowPaging = value; }
        // set可以接受「外部傳來的值」，並以 value變數來儲存。
    }
//屬性（Property）讓類別能夠在隱藏實作或驗證程式碼的同時，以公開的方式取得並設定值。
//get 屬性存取子是用來 [傳回] 屬性值，而 set 存取子是用來 [指定] 新值。 這些存取子可能具有不同的存取層級。 
//value 關鍵字的用途是定義由 set 存取子所指定的值。
//沒有實作 set 存取子的屬性就是唯讀（ReadOnly）。


    //====================================
    //== 重點！！必須在 Page_PreRender這個事件才行！！ ==
    //====================================
    protected void Page_PreRender(object sender, EventArgs e)
    {
                GridView1.PageSize = 5;
                GridView1.AllowPaging = YesOrNo_AllowPaging;
    }



    protected void Page_Load(object sender, EventArgs e)
    {

    }
}