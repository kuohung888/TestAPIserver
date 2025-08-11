using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_listbox02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeCourses();
            UpdateCreditSummary();
        }
    }

    public class Course
    {
        public string Name { get; set; }
        public int Credit { get; set; }
    }

    private void InitializeCourses()
    {
        List<Course> courses = new List<Course>
        {
            new Course { Name = "計算機概論", Credit = 3 },
            new Course { Name = "資料結構", Credit = 3 },
            new Course { Name = "演算法", Credit = 3 },
            new Course { Name = "網路程式設計", Credit = 4 },  // 高學分課程
            new Course { Name = "資料庫系統", Credit = 3 },
            new Course { Name = "人工智慧", Credit = 4 },      // 高學分課程
            new Course { Name = "雲端計算", Credit = 4 }       // 高學分課程
        };

        lbAvailableCourses.DataSource = courses;
        lbAvailableCourses.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (lbAvailableCourses.SelectedIndex == -1)
        {
            ShowAlert("請選擇要加選的課程!");
            return;
        }

        int currentCredits = GetSelectedCredits();
        for (int i = lbAvailableCourses.Items.Count - 1; i >= 0; i--)
        {
            if (lbAvailableCourses.Items[i].Selected)
            {
                int courseCredit = int.Parse(lbAvailableCourses.Items[i].Value);
                if (currentCredits + courseCredit > 12)
                {
                    ShowAlert($"無法加選！已選學分 {currentCredits} + 本課程 {courseCredit} 超過 12 學分上限");
                    return;
                }

                lbSelectedCourses.Items.Add(lbAvailableCourses.Items[i]);
                lbAvailableCourses.Items.RemoveAt(i);
            }
        }
        UpdateCreditSummary();
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (lbSelectedCourses.SelectedIndex == -1)
        {
            ShowAlert("請選擇要退選的課程!");
            return;
        }

        for (int i = lbSelectedCourses.Items.Count - 1; i >= 0; i--)
        {
            if (lbSelectedCourses.Items[i].Selected)
            {
                lbAvailableCourses.Items.Add(lbSelectedCourses.Items[i]);
                lbSelectedCourses.Items.RemoveAt(i);
            }
        }
        UpdateCreditSummary();
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtStudentName.Text))
        {
            ShowAlert("請輸入學生姓名!");
            return;
        }

        if (lbSelectedCourses.Items.Count == 0)
        {
            ShowAlert("尚未選擇任何課程!");
            return;
        }

        // 顯示結果
        lblStudentName.Text = txtStudentName.Text.Trim();
        bltSelectedCourses.DataSource = GetSelectedCourseNames();
        bltSelectedCourses.DataBind();
        lblTotalCredits.Text = GetSelectedCredits().ToString();

        // 鎖定系統
        pnlResult.Visible = true;
        SetControlsEnabled(false);
    }

    private void UpdateCreditSummary()
    {
        lblAvailableCredits.Text = CalculateTotalCredits(lbAvailableCourses).ToString();
        lblSelectedCredits.Text = CalculateTotalCredits(lbSelectedCourses).ToString();
    }

    private int CalculateTotalCredits(ListBox listBox)
    {
        int total = 0;
        foreach (ListItem item in listBox.Items)
        {
            total += int.Parse(item.Value);
        }
        return total;
    }

    private int GetSelectedCredits() => CalculateTotalCredits(lbSelectedCourses);

    private List<string> GetSelectedCourseNames()
    {
        var courses = new List<string>();
        foreach (ListItem item in lbSelectedCourses.Items)
        {
            courses.Add($"{item.Text} ({item.Value}學分)");
        }
        return courses;
    }

    private void SetControlsEnabled(bool enabled)
    {
        txtStudentName.Enabled = enabled;
        lbAvailableCourses.Enabled = enabled;
        lbSelectedCourses.Enabled = enabled;
        btnAdd.Enabled = enabled;
        btnRemove.Enabled = enabled;
        btnConfirm.Enabled = enabled;

        if (!enabled)
        {
            txtStudentName.CssClass += " disabled-control";
            lbAvailableCourses.CssClass += " disabled-control";
            lbSelectedCourses.CssClass += " disabled-control";
        }
    }

    private void ShowAlert(string message)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
    }

}