using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_listbox01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // 初始化課程清單
            InitializeCourses();
        }
    }

    private void InitializeCourses()
    {
        List<string> courses = new List<string>
        {
            "計算機概論",
            "資料結構",
            "演算法",
            "網路程式設計",
            "資料庫系統",
            "人工智慧",
            "機器學習",
            "雲端計算"
        };

        lbAvailableCourses.DataSource = courses;
        lbAvailableCourses.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (lbAvailableCourses.SelectedIndex == -1)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('請選擇要加選的課程!');", true);
            return;
        }

        // 移動選中項目到右側
        for (int i = lbAvailableCourses.Items.Count - 1; i >= 0; i--)
        {
            if (lbAvailableCourses.Items[i].Selected)
            {
                lbSelectedCourses.Items.Add(lbAvailableCourses.Items[i]);
                lbAvailableCourses.Items.RemoveAt(i);
            }
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (lbSelectedCourses.SelectedIndex == -1)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('請選擇要退選的課程!');", true);
            return;
        }

        // 移動選中項目到左側
        for (int i = lbSelectedCourses.Items.Count - 1; i >= 0; i--)
        {
            if (lbSelectedCourses.Items[i].Selected)
            {
                lbAvailableCourses.Items.Add(lbSelectedCourses.Items[i]);
                lbSelectedCourses.Items.RemoveAt(i);
            }
        }
    }
}