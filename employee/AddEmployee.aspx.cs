using System;
using System.Configuration;
using System.Data.SqlClient;

namespace employee
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string position = txtPosition.Text.Trim();
            string department = txtDepartment.Text.Trim();
            string hireDateStr = txtHireDate.Text.Trim();
            string salaryStr = txtSalary.Text.Trim();

            DateTime hireDate;
            decimal salary;

            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(position) || string.IsNullOrEmpty(department) ||
                !DateTime.TryParse(hireDateStr, out hireDate) ||
                !decimal.TryParse(salaryStr, out salary))
            {
                lblMessage.Text = "請正確填寫所有欄位。";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;
            string sql = @"INSERT INTO Employees (FirstName, LastName, Position, Department, HireDate, Salary)
                           VALUES (@FirstName, @LastName, @Position, @Department, @HireDate, @Salary)";

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Position", position);
                cmd.Parameters.AddWithValue("@Department", department);
                cmd.Parameters.AddWithValue("@HireDate", hireDate);
                cmd.Parameters.AddWithValue("@Salary", salary);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "新增成功！";
                    // 清空欄位
                    txtFirstName.Text = "";
                    txtLastName.Text = "";
                    txtPosition.Text = "";
                    txtDepartment.Text = "";
                    txtHireDate.Text = "";
                    txtSalary.Text = "";
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "新增失敗：" + ex.Message;
                }
            }
        }
    }
}