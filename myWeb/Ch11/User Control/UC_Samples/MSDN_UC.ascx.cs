using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MSDN_UC : System.Web.UI.UserControl
{

    //    資料來源 -- http://msdn.microsoft.com/zh-tw/library/26db8ysc%28VS.80%29.aspx

    //    使用者控制項會顯示其中包含數字的唯讀文字方塊，以及兩個能夠讓使用者按下的箭號Button，
    //    以遞增和遞減文字方塊中的值。
    //    控制項會公開可以在裝載網頁中使用的三個屬性：MinValue、MaxValue 和 CurrentValue。
    //=========== (start) ========================
    private int m_minValue = 0;
    private int m_maxValue = 100;

    private int m_currentNumber = 0;
    public int MinValue
    {
        get { return m_minValue; }
        // get使用 return，將「值」傳回給呼叫這個屬性的程式。

        set
        {  // set可以接受「外部傳來的值」，並以 value變數來儲存。
            if (value >= this.MaxValue)
                throw new Exception("MinValue must be less than MaxValue. [最小值]必須小於[最大值]");
            else
                m_minValue = value;
        }
    }

    public int MaxValue
    {
        get { return m_maxValue; }
        // get使用 return，將「值」傳回給呼叫這個屬性的程式。

        set
        {  // set可以接受「外部傳來的值」，並以 value變數來儲存。
            if (value <= this.MinValue)
                throw new Exception("MaxValue must be greater than MinValue.  [最大值]必須大於[最小值]");
            else
                m_maxValue = value;
        }
    }

    public int CurrentNumber
    {
        get { return m_currentNumber; }
        // get使用 return，將「值」傳回給呼叫這個屬性的程式。
    }
    //=========== (end) ==========================



    protected void Page_Load(Object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            m_currentNumber =
                Int16.Parse(ViewState["currentNumber"].ToString());
        }
        else
        {
            m_currentNumber = this.MinValue;
        }
        DisplayNumber();
    }

    protected void DisplayNumber()
    {
        textNumber.Text = this.CurrentNumber.ToString();
        ViewState["currentNumber"] = this.CurrentNumber.ToString();
    }

    protected void buttonUp_Click(Object sender, EventArgs e)
    {
        if (m_currentNumber == this.MaxValue)
        {
            m_currentNumber = this.MinValue;
        }
        else
        {
            m_currentNumber += 1;
        }
        DisplayNumber();
    }

    protected void buttonDown_Click(Object sender, EventArgs e)
    {
        if (m_currentNumber == this.MinValue)
        {
            m_currentNumber = this.MaxValue;
        }
        else
        {
            m_currentNumber -= 1;
        }
        DisplayNumber();
    }


}