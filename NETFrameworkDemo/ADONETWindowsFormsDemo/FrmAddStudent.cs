using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADONETWindowsFormsDemo
{
    public partial class FrmAddStudent : Form
    {
        public FrmAddStudent()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            //获取用户输入的学生信息
            string stuName = txtStuName.Text.Trim();
            string stuNum = txtStuNum.Text.Trim();
            string stuClass = txtStuClass.Text.Trim();
            string speciality = txtSpeciality.Text.Trim();
            string stuPhone = txtStuPhone.Text.Trim();
            //根据用户的选择把性别转换成男或女
            string stuSex = radioB.Checked == true ? "男" : "女";
            //年龄值防止用户输入的不合法，如果不合法则用0表示
            int stuAge;
            Int32.TryParse(txtStuAge.Text.Trim(), out stuAge);
            if (String.IsNullOrEmpty(stuName) || String.IsNullOrEmpty(stuNum) || String.IsNullOrEmpty(stuClass) || String.IsNullOrEmpty(speciality))
            {
                MessageBox.Show("学号、姓名、班级、专业均不要能为空");
            }
            else
            {               
                //下面sql语句使用占位符写法会更简洁
                string sql = string.Format("insert into student values('{0}','{1}','{2}',{3},'{4}','{5}','{6}')", stuNum, stuName, stuSex, stuAge, stuClass, speciality,stuPhone);
               
                int count = SqlHelper.ExecuteNonQuery(sql);
                if (count > 0)
                {
                    MessageBox.Show("添加成功");
                }
                //关闭当前窗体，回到主窗体
                this.Close();
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtStuNum.Text = "";
            txtStuName.Text = "";         
            txtStuClass.Text = "";
            txtSpeciality.Text = string.Empty;
            txtStuAge.Text = string.Empty;
            txtStuPhone.Text = string.Empty;
            radioB.Checked= true;//默认选择到男
        }
    }
}
