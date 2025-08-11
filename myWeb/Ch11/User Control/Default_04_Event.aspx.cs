using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_04_Event : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        ////方法一：
        ////--寫在 HTML網頁裡面了，直接寫在 UC標籤內部。
        //           <mis2000lab:GridView1 runat="server" ID="mis2000GV" 
        //                                   Onmis2000lab_EditRecord="mis2000lab_EditRecord" 
        //                                   Onmis2000lab_FinishedEditRecord="mis2000lab_FinishedEditRecord" />

        ////方法二：
        mis2000GV.mis2000lab_EditRecord +=
             new WebUserControl_04_Event.mis2000lab_EditRecordHandler(mis2000GV_mis2000lab_EditRecord);
        //            UC的類別名稱                     ^^^^^^^^^^^^^^^^^^^^  (UC的ID名稱_事件名稱) 例如 Button1_Click

        mis2000GV.mis2000lab_FinishedEditRecord +=
           new WebUserControl_04_Event.mis2000lab_FinishedEditRecordHandler(mis2000GV_mis2000lab_FinishedEditRecord);
        //            UC的類別名稱                     ^^^^^^^^^^^^^^^^^^^^^^^^^^  (UC的ID名稱_事件名稱) 例如 Button1_Click
    }


    //-- 產生的兩個事件，如下：
    protected void mis2000GV_mis2000lab_EditRecord()
    {

    }
    protected void mis2000GV_mis2000lab_FinishedEditRecord()
    {

    }
}