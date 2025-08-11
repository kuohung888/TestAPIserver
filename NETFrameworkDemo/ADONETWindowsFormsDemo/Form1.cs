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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DataGridViewDataLoad();
            ComboBoxDataLoad();
        }
        private void DataGridViewDataLoad(string sql = "select ID,Num as '学号', Name as  '姓名',Sex as '性别',Age as '年龄',Class as '班级',Speciality as '专业',Phone as '电话'  from student")
        {
            //由于sql语句不含占位符，所以ExecuteDataTable方法的第2个参数可以不写，或者些null
            DataTable dt = SqlHelper.ExecuteDataTable(sql);
            //为DataGridView绑定数据源
            dataGridViewStuInfo.DataSource = dt;
            //把第1列ID值隐藏
            dataGridViewStuInfo.Columns[0].Visible = false;
            //dataGridViewStuInfo.Columns["Num"].HeaderText = "学号";
        }
        private void ComboBoxDataLoad()
        {
            //清除列表框原有内容
            cmbSpeciality.Items.Clear();
            //为列表框增加“全部”选择项
            cmbSpeciality.Items.Add("全部");
            //指定列表框中“全部”选择项为默认选择项
            cmbSpeciality.SelectedIndex = 0;        
            string sql = "select distinct Speciality from student";           
            SqlDataReader reader=SqlHelper.ExecuteReader(sql);    
            //reader.HasRows为true表示上面方法ExecuteReader()执行后有数据
            if (reader.HasRows)
            {
                while (reader.Read() == true)
                {
                    string rs = reader[0].ToString();
                    cmbSpeciality.Items.Add(rs);
                }
            }
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            string stuNum = txtStuNum.Text.Trim();
            string stuName = txtStuName.Text.Trim();
            string stuClass = txtStuClass.Text.Trim();
            string speciality = cmbSpeciality.Text.Trim();
            StringBuilder sql = new StringBuilder("select ID,Num as '学号', Name as  '姓名',Sex as '性别',Age as '年龄',Class as '班级',Speciality as '专业',Phone as '电话'  from student where 1=1");
            if (!String.IsNullOrEmpty(stuNum))
            {
                sql.Append(" and Num='" + stuNum + "'");
            }
            if (!String.IsNullOrEmpty(stuName))
            {
                sql.Append(" and Name like '%" + stuName + "%'");
            }
            if (!String.IsNullOrEmpty(stuClass))
            {
                sql.Append(" and Class like '%" + stuClass + "%'");
            }
            if (speciality != "全部")
            {
                sql.Append(" and Speciality = '" + speciality + "'");           
            }
            DataGridViewDataLoad(sql.ToString());
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            FrmAddStudent addstudent = new FrmAddStudent();
            addstudent.ShowDialog();
            //添加完记录后重新加载student表中数据
            DataGridViewDataLoad();
            //添加完记录后重新加载专业数据
            ComboBoxDataLoad();
        }

        private void dataGridViewStuInfo_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int id = Convert.ToInt32(this.dataGridViewStuInfo.Rows[e.RowIndex].Cells[0].Value);
            FrmUpdateStudent updatestudent = new FrmUpdateStudent(id);
            updatestudent.ShowDialog();
            DataGridViewDataLoad();
            ComboBoxDataLoad();
        }

        private void dataGridViewStuInfo_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            DialogResult result = MessageBox.Show("确定要删除吗？", "确定删除", MessageBoxButtons.OKCancel);
            if (result == DialogResult.OK)
            {
                int id = Convert.ToInt32(this.dataGridViewStuInfo.Rows[e.RowIndex].Cells[0].Value);
               
                string sql = "delete from Student where ID=@id";
                SqlParameter pam = new SqlParameter("@id", id);
                int count = SqlHelper.ExecuteNonQuery(sql,pam);
                if (count > 0)
                {
                    MessageBox.Show("删除成功");

                }
            }
            DataGridViewDataLoad();
            ComboBoxDataLoad();
        }
    }
}
