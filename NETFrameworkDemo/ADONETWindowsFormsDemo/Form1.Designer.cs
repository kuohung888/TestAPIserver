namespace ADONETWindowsFormsDemo
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.btnAdd = new System.Windows.Forms.Button();
            this.dataGridViewStuInfo = new System.Windows.Forms.DataGridView();
            this.btnSelect = new System.Windows.Forms.Button();
            this.cmbSpeciality = new System.Windows.Forms.ComboBox();
            this.txtStuClass = new System.Windows.Forms.TextBox();
            this.txtStuName = new System.Windows.Forms.TextBox();
            this.txtStuNum = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewStuInfo)).BeginInit();
            this.SuspendLayout();
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(5, 282);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(88, 28);
            this.btnAdd.TabIndex = 16;
            this.btnAdd.Text = "添加";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // dataGridViewStuInfo
            // 
            this.dataGridViewStuInfo.AllowUserToAddRows = false;
            this.dataGridViewStuInfo.AllowUserToDeleteRows = false;
            this.dataGridViewStuInfo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewStuInfo.Location = new System.Drawing.Point(3, 41);
            this.dataGridViewStuInfo.Name = "dataGridViewStuInfo";
            this.dataGridViewStuInfo.ReadOnly = true;
            this.dataGridViewStuInfo.RowTemplate.Height = 23;
            this.dataGridViewStuInfo.Size = new System.Drawing.Size(734, 235);
            this.dataGridViewStuInfo.TabIndex = 15;
            this.dataGridViewStuInfo.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewStuInfo_CellContentClick);
            this.dataGridViewStuInfo.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewStuInfo_CellDoubleClick);
            // 
            // btnSelect
            // 
            this.btnSelect.Location = new System.Drawing.Point(661, 12);
            this.btnSelect.Name = "btnSelect";
            this.btnSelect.Size = new System.Drawing.Size(76, 22);
            this.btnSelect.TabIndex = 14;
            this.btnSelect.Text = "查询";
            this.btnSelect.UseVisualStyleBackColor = true;
            this.btnSelect.Click += new System.EventHandler(this.btnSelect_Click);
            // 
            // cmbSpeciality
            // 
            this.cmbSpeciality.FormattingEnabled = true;
            this.cmbSpeciality.Location = new System.Drawing.Point(541, 13);
            this.cmbSpeciality.Name = "cmbSpeciality";
            this.cmbSpeciality.Size = new System.Drawing.Size(96, 20);
            this.cmbSpeciality.TabIndex = 13;
            // 
            // txtStuClass
            // 
            this.txtStuClass.Location = new System.Drawing.Point(371, 14);
            this.txtStuClass.Name = "txtStuClass";
            this.txtStuClass.Size = new System.Drawing.Size(112, 21);
            this.txtStuClass.TabIndex = 10;
            // 
            // txtStuName
            // 
            this.txtStuName.Location = new System.Drawing.Point(204, 14);
            this.txtStuName.Name = "txtStuName";
            this.txtStuName.Size = new System.Drawing.Size(112, 21);
            this.txtStuName.TabIndex = 11;
            // 
            // txtStuNum
            // 
            this.txtStuNum.Location = new System.Drawing.Point(38, 14);
            this.txtStuNum.Name = "txtStuNum";
            this.txtStuNum.Size = new System.Drawing.Size(112, 21);
            this.txtStuNum.TabIndex = 12;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(506, 17);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 6;
            this.label4.Text = "专业";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(336, 17);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 7;
            this.label3.Text = "班级";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(169, 17);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 12);
            this.label2.TabIndex = 8;
            this.label2.Text = "姓名";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 12);
            this.label1.TabIndex = 9;
            this.label1.Text = "学号";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(743, 319);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.dataGridViewStuInfo);
            this.Controls.Add(this.btnSelect);
            this.Controls.Add(this.cmbSpeciality);
            this.Controls.Add(this.txtStuClass);
            this.Controls.Add(this.txtStuName);
            this.Controls.Add(this.txtStuNum);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewStuInfo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.DataGridView dataGridViewStuInfo;
        private System.Windows.Forms.Button btnSelect;
        private System.Windows.Forms.ComboBox cmbSpeciality;
        private System.Windows.Forms.TextBox txtStuClass;
        private System.Windows.Forms.TextBox txtStuName;
        private System.Windows.Forms.TextBox txtStuNum;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
    }
}

