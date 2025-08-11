namespace ADONETWindowsFormsDemo
{
    partial class FrmAddStudent
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
            this.btnClear.Location = new System.Drawing.Point(118, 243);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(77, 28);
            this.btnClear.TabIndex = 18;
            this.btnClear.Text = "清空";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(25, 243);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(77, 28);
            this.btnSave.TabIndex = 19;
            this.btnSave.Text = "提交";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.radioG);
            this.panel1.Controls.Add(this.radioB);
            this.panel1.Location = new System.Drawing.Point(58, 196);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(167, 28);
            this.panel1.TabIndex = 17;
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
            this.txtStuPhone.Location = new System.Drawing.Point(59, 162);
            this.txtStuPhone.Name = "txtStuPhone";
            this.txtStuPhone.Size = new System.Drawing.Size(158, 21);
            this.txtStuPhone.TabIndex = 11;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(14, 200);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(29, 12);
            this.label7.TabIndex = 4;
            this.label7.Text = "性别";
            // 
            // txtStuAge
            // 
            this.txtStuAge.Location = new System.Drawing.Point(59, 132);
            this.txtStuAge.Name = "txtStuAge";
            this.txtStuAge.Size = new System.Drawing.Size(158, 21);
            this.txtStuAge.TabIndex = 12;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(14, 169);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(29, 12);
            this.label6.TabIndex = 5;
            this.label6.Text = "电话";
            // 
            // txtSpeciality
            // 
            this.txtSpeciality.Location = new System.Drawing.Point(59, 102);
            this.txtSpeciality.Name = "txtSpeciality";
            this.txtSpeciality.Size = new System.Drawing.Size(158, 21);
            this.txtSpeciality.TabIndex = 13;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(14, 138);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(29, 12);
            this.label5.TabIndex = 6;
            this.label5.Text = "年龄";
            // 
            // txtStuClass
            // 
            this.txtStuClass.Location = new System.Drawing.Point(59, 72);
            this.txtStuClass.Name = "txtStuClass";
            this.txtStuClass.Size = new System.Drawing.Size(158, 21);
            this.txtStuClass.TabIndex = 14;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(14, 107);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 7;
            this.label4.Text = "专业";
            // 
            // txtStuNum
            // 
            this.txtStuNum.Location = new System.Drawing.Point(59, 42);
            this.txtStuNum.Name = "txtStuNum";
            this.txtStuNum.Size = new System.Drawing.Size(158, 21);
            this.txtStuNum.TabIndex = 15;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 76);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 8;
            this.label3.Text = "班级";
            // 
            // txtStuName
            // 
            this.txtStuName.Location = new System.Drawing.Point(59, 12);
            this.txtStuName.Name = "txtStuName";
            this.txtStuName.Size = new System.Drawing.Size(158, 21);
            this.txtStuName.TabIndex = 16;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(14, 45);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 12);
            this.label2.TabIndex = 9;
            this.label2.Text = "学号";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 12);
            this.label1.TabIndex = 10;
            this.label1.Text = "姓名";
            // 
            // FrmAddStudent
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(231, 282);
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
            this.Name = "FrmAddStudent";
            this.Text = "添加学生信息";
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