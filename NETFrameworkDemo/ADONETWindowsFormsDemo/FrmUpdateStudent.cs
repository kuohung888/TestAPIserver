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
using static System.Windows.Forms.AxHost;
using System.Xml.Linq;

namespace ADONETWindowsFormsDemo
{
    public partial class FrmUpdateStudent : Form
    {
        public int ID;

        public FrmUpdateStudent(int id)
        {
            
            ID = id;
            InitializeComponent();
        }

        private void FrmUpdateStudent_Load(object sender, EventArgs e)
        {         
            string sql = "select * from student where ID=@id";
            SqlParameter pam = new SqlParameter("@id", ID);
            SqlDataReader dataReader;
            dataReader = SqlHelper.ExecuteReader(sql,pam);
            if (dataReader.HasRows)
            {
                dataReader.Read();            
                this.txtStuNum.Text = dataReader.GetString(1);
                this.txtStuName.Text = dataReader.GetString(2);
                if (!Convert.IsDBNull(dataReader[3]) && dataReader.GetString(3) == "女")
                {
                    this.radioG.Checked = true;
                }
                else
                {
                    this.radioB.Checked = true;
                }
                this.txtStuAge.Text = Convert.IsDBNull(dataReader[4]) ? "" : dataReader.GetInt32(4).ToString();
                this.txtStuClass.Text = dataReader.GetString(5);
                this.txtSpeciality.Text = dataReader.GetString(6);               
                this.txtStuPhone.Text = Convert.IsDBNull(dataReader[7]) ? "" : dataReader.GetString(7);             
            }
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
                string sql = string.Format("update student set Num = '{0}', Name = '{1}',Sex = '{2}', Age ={3},Class = '{4}', Speciality = '{5}', Phone = '{6}' where ID = {7}", stuNum, stuName, stuSex, stuAge, stuClass, speciality,  stuPhone,ID);               
                int count = SqlHelper.ExecuteNonQuery(sql);
                if (count > 0)
                {
                    MessageBox.Show("更新成功");
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
            radioB.Checked = true;//默认选择到男
        }
    }
}
