using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentSorter : System.Web.UI.Page
{
    private List<Student> students = new List<Student>()
    {
        new Student { Name = "Student1", Chinese = 90, English = 72, Math = 92 },
        new Student { Name = "Student2", Chinese = 95, English = 81, Math = 70 },
        new Student { Name = "Student3", Chinese = 77, English = 90, Math = 85 },
        new Student { Name = "Student4", Chinese = 85, English = 87, Math = 95 },
        new Student { Name = "Student5", Chinese = 96, English = 84, Math = 79 },
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (var student in students)
        {
            student.TotalScore = student.Chinese + student.English + student.Math;
            student.AverageScore = (double)student.TotalScore / 3;
        }
        GridView1.DataSource = students;
        GridView1.DataBind();
    }

    protected void btnTotalScore_Click(object sender, EventArgs e)
    {
        students = students.OrderByDescending(s => s.TotalScore).ToList();
        GridView1.DataSource = students;
        GridView1.DataBind();
    }

    protected void btnAverageScore_Click(object sender, EventArgs e)
    {
        students = students.OrderBy(s => s.AverageScore).ToList();
        GridView1.DataSource = students;
        GridView1.DataBind();
    }
}

public class Student
{
    public string Name { get; set; }
    public int Chinese { get; set; }
    public int English { get; set; }
    public int Math { get; set; }
    public int TotalScore { get; set; }
    public double AverageScore { get; set; }
}