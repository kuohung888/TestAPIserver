using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//建立樣板化 的 UC(使用者控制項)  http://msdn.microsoft.com/zh-tw/library/36574bf6(v=vs.80).aspx

//1. 在 .ascx 檔案中，在想要顯示樣板的位置上加入 ASP.NET PlaceHolder 控制項。
//2. 在使用者控制項的程式碼中，實作型別 ITemplate 的屬性。
//3. 定義實作 INamingContainer 介面當做容器的伺服器控制項類別，以建立樣板的執行個體。這個就稱為樣板的命名容器。
//4. 將 TemplateContainerAttribute 套用至實作 ITemplate 的屬性 (Property)，並將樣板的命名容器型別當做引數，傳遞至屬性 (Attribute) 的建構函式。
//5. 在控制項的 Init 方法中，重複下列步驟一次或多次：
//   **建立命名容器類別的執行個體。
//   **在命名容器中建立樣板的執行個體。
//   **將命名容器執行個體加入至 PlaceHolder 伺服器控制項的 Controls 屬性中。




public partial class MSDN_UC_Template : System.Web.UI.UserControl
{
    //*******************************************
    private ITemplate messageTemplate = null;
    //*******************************************

    

    //== TemplateContainerAttribute 類別 ==
    // 屬性 (Property) 傳回 ITemplate 介面並使用 TemplateContainerAttribute屬性 (Attribute)標記，宣告其容器控制項的基底型別。 
    // 具有 ITemplate屬性的控制項必須實作 INamingContainer介面。 
    // 資料來源  http://msdn.microsoft.com/zh-tw/library/system.web.ui.templatecontainerattribute(v=vs.110).aspx

    [TemplateContainer(typeof(MessageContainer))]
    //== 註解：MessageContainer是自訂的 Class，請看程式下面的CLass。
    public ITemplate MessageTemplate   //-- 樣板
    {
        get
        {
            return messageTemplate;
        }
        set
        {
            messageTemplate = value;
        }
    }


    //==============================================
    protected void Page_Init(object sender, EventArgs e)
    {
        if (messageTemplate != null)
        {
            String[] fruits = { "apple", "orange", "banana", "pineapple" };
            for (int i = 0; i < 4; i++)
            {
                MessageContainer container = new MessageContainer(i, fruits[i]);
                //== 註解：MessageContainer是自訂的 Class，請看程式下面的CLass。
                messageTemplate.InstantiateIn(container);

                PlaceHolder1.Controls.Add(container);
            }
        }
    }
}    //第一個 class結束


//*** 第二個 Class ********************************************************
//************************************************************************
public class MessageContainer : Control, INamingContainer
{
    private int m_index;
    private String m_message;
    internal MessageContainer(int index, String message)
    {
        m_index = index;
        m_message = message;
    }
    public int Index
    {
        get
        {
            return m_index;
        }
    }
    public String Message
    {
        get
        {
            return m_message;
        }
    }
}

