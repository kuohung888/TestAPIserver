namespace ADONETWindowsFormsDemo
{
    partial class FrmUpdateStudent
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnClear = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.radioG = new System.Windows.Forms.RadioButton();
            this.radioB = new System.Windows.Forms.RadioButton();
            this.txtStuPhone = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtStuAge = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtSpeciality = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtStuClass = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtStuNum = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtStuName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(111, 239);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(77, 28);
            this.btnClear.TabIndex = 34;
            this.btnClear.Text = "清空";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(18, 239);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(77, 28);
            this.btnSave.TabIndex = 35;
            this.btnSave.Text = "提交";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.radioG);
            this.panel1.Controls.Add(this.radioB);
            this.panel1.Location = new System.Drawing.Point(51, 192);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(167, 28);
            this.panel1.TabIndex = 33;
            // 
            // radioG
            // 
            this.radioG.AutoSize = true;
            this.radioG.Location = new System.Drawing.Point(44, 3);
            this.radioG.Name = "radioG";
            this.radioG.Size = new System.Drawing.Size(35, 16);
            this.radioG.TabIndex = 0;
            this.radioG.TabStop = true;
            this.radioG.Text = "女";
            this.radioG.UseVisualStyleBackColor = true;
            // 
            // radioB
            // 
            this.radioB.AutoSize = true;
            this.radioB.Checked = true;
            this.radioB.Location = new System.Drawing.Point(3, 3);
            this.radioB.Name = "radioB";
            this.radioB.Size = new System.Drawing.Size(35, 16);
            this.radioB.TabIndex = 0;
            this.radioB.TabStop = true;
            this.radioB.Text = "男";
            this.radioB.UseVisualStyleBackColor = true;
            // 
            // txtStuPhone
            // 
            this.txtStuPhone.Location = new System.Drawing.Point(52, 158);
            this.txtStuPhone.Name = "txtStuPhone";
            this.txtStuPhone.Size = new System.Drawing.Size(158, 21);
            this.txtStuPhone.TabIndex = 27;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(7, 196);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(29, 12);
            this.label7.TabIndex = 20;
            this.label7.Text = "性别";
            // 
            // txtStuAge
            // 
            this.txtStuAge.Location = new System.Drawing.Point(52, 128);
            this.txtStuAge.Name = "txtStuAge";
            this.txtStuAge.Size = new System.Drawing.Size(158, 21);
            this.txtStuAge.TabIndex = 28;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(7, 165);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(29, 12);
            this.label6.TabIndex = 21;
            this.label6.Text = "电话";
            // 
            // txtSpeciality
            // 
            this.txtSpeciality.Location = new System.Drawing.Point(52, 98);
            this.txtSpeciality.Name = "txtSpeciality";
            this.txtSpeciality.Size = new System.Drawing.Size(158, 21);
            this.txtSpeciality.TabIndex = 29;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 134);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(29, 12);
            this.label5.TabIndex = 22;
            this.label5.Text = "年龄";
            // 
            // txtStuClass
            // 
            this.txtStuClass.Location = new System.Drawing.Point(52, 68);
            this.txtStuClass.Name = "txtStuClass";
            this.txtStuClass.Size = new System.Drawing.Size(158, 21);
            this.txtStuClass.TabIndex = 30;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 103);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 23;
            this.label4.Text = "专业";
            // 
            // txtStuNum
            // 
            this.txtStuNum.Location = new System.Drawing.Point(52, 38);
            this.txtStuNum.Name = "txtStuNum";
            this.txtStuNum.Size = new System.Drawing.Size(158, 21);
            this.txtStuNum.TabIndex = 31;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(7, 72);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 24;
            this.label3.Text = "班级";
            // 
            // txtStuName
            // 
            this.txtStuName.Location = new System.Drawing.Point(52, 8);
            this.txtStuName.Name = "txtStuName";
            this.txtStuName.Size = new System.Drawing.Size(158, 21);
            this.txtStuName.TabIndex = 32;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 41);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 12);
            this.label2.TabIndex = 25;
            this.label2.Text = "学号";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 12);
            this.label1.TabIndex = 26;
            this.label1.Text = "姓名";
            // 
            // FrmUpdateStudent
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(222, 278);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.txtStuPhone);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtStuAge);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtSpeciality);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtStuClass);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtStuNum);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtStuName);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "FrmUpdateStudent";
            this.Text = "修改学生信息";
            this.Load += new System.EventHandler(this.FrmUpdateStudent_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.RadioButton radioG;
        private System.Windows.Forms.RadioButton radioB;
        private System.Windows.Forms.TextBox txtStuPhone;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtStuAge;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtSpeciality;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtStuClass;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtStuNum;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtStuName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
    }
}