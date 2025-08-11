using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;   //引用MySql
using System.IO;
using System.Runtime.InteropServices;

namespace Stack_Map_GATS_GUI
{
    public partial class Form1 : Form
    {
        public int cal_method = 1;
        public int BLOCK_X_SIZE, BLOCK_Y_SIZE;

        public Form1()
        {
            InitializeComponent();
            Initial_INI_File();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Stack_Map_Class SM_class = new Stack_Map_Class();
            SM_class.Log("Form1_Load: Start");

            SM_class.connect_DB("10.16.22.228", "hlsystem_common", "5910", "5910"); //確認server連線
            SM_class.Stack_Map_Count(this.cal_method);// 抓取當下資料疊圖統計結果
            SM_class.Backup_log_file();// 備份

            /// 將已有頁面先移除,後續再重新產生新頁面.
            int page_count = tabControl1.TabPages.Count;
            for (int tab_i = 0; tab_i < page_count; tab_i++)
            {
                tabControl1.TabPages.RemoveAt(0); // 移除位置0的page, 注意:不能依序刪掉,因為按照順序值去刪會有錯,得從後面刪回來.
            }

            #region 顯示基本資訊於介面
            lot_num_lab.Text = SM_class.lot_num;
            part_version_lab.Text = SM_class.part_version;
            datetime_lab.Text = String.Format("{0} ~ {1}", SM_class.start_time.ToString("yyyy-MM-dd hh:mm"), SM_class.end_time.ToString("yyyy-MM-dd hh:mm"));
            strip_qty_lab.Text = SM_class.strip_qty.ToString();
            // 設定數字範圍
            level1_lab.Text = String.Format("{0}% ~ {1}%", SM_class.lower_limit_array[0], SM_class.upper_limit_array[0]);// 0 % ~20 %
            level2_lab.Text = String.Format("{0}% ~ {1}%", SM_class.lower_limit_array[1], SM_class.upper_limit_array[1]);// 0 % ~20 %
            level3_lab.Text = String.Format("{0}% ~ {1}%", SM_class.lower_limit_array[2], SM_class.upper_limit_array[2]);// 0 % ~20 %
            level4_lab.Text = String.Format("{0}% ~ {1}%", SM_class.lower_limit_array[3], SM_class.upper_limit_array[3]);// 0 % ~20 %
            level5_lab.Text = String.Format("{0}% ~ {1}%", SM_class.lower_limit_array[4], SM_class.upper_limit_array[4]);// 0 % ~20 %
            // 設定顏色
            color1_lab.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[0])); //設定指定欄位cell背景顏色
            color2_lab.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[1])); //設定指定欄位cell背景顏色
            color3_lab.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[2])); //設定指定欄位cell背景顏色
            color4_lab.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[3])); //設定指定欄位cell背景顏色
            color5_lab.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[4])); //設定指定欄位cell背景顏色
            #endregion

            // 以程式設計方式彈性加入索引標籤(好處:以後若有增加新的Mode,便可以簡單擴增)
            for (int tab_i=0; tab_i< SM_class.mode_name_list.Length; tab_i++)
            {
                string mode_name = SM_class.mode_name_list[tab_i];
                TabPage TabPage_temp = new TabPage(mode_name);
                //TabPage_temp.Name = String.Format("TabPage_{0}", mode_name);

                // 創建DataGridView
                DataGridView dataGridView_left = new DataGridView();
                DataGridView dataGridView_right = new DataGridView();
                dataGridView_left.ColumnCount = SM_class.strip_x_num;     //設定欄位數
                dataGridView_right.ColumnCount = SM_class.strip_x_num;    //設定欄位數


                #region 將Array中結果依序放置入DataGridView
                // ==================================================================================
                for (int row_i = 0; row_i < SM_class.strip_y_num; row_i++)
                {
                    DataGridViewRow row1 = new DataGridViewRow();
                    DataGridViewRow row2 = new DataGridViewRow();
                    row1.CreateCells(dataGridView_left);
                    row2.CreateCells(dataGridView_right);

                    // 裝滿一列至row中
                    for (int col_i = 0; col_i < SM_class.strip_x_num; col_i++)
                    {
                        row1.Cells[col_i].Value = SM_class.left_array_dict[mode_name][col_i, row_i]; 
                        row2.Cells[col_i].Value = SM_class.right_array_dict[mode_name][col_i, row_i];
                    }

                    dataGridView_left.Rows.Add(row1);
                    dataGridView_right.Rows.Add(row2);
                }
                // ==================================================================================
                #endregion

                #region 設定DataGridView
                // ==================================================================================
                dataGridView_left.Name = "page" + tab_i + "_left_dgv";
                dataGridView_right.Name = "page" + tab_i + "_right_dgv";

                dataGridView_left.Location = new Point(17, 30);             //設定放置位置
                dataGridView_right.Location = new Point(330, 30);           //設定放置位置
                dataGridView_left.Size = new Size(303, 336);                //設定dataGridView大小
                dataGridView_right.Size = new Size(303, 336);               //設定dataGridView大小
                //dataGridView_left.Font = new System.Drawing.Font("微軟正黑體", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
                //dataGridView_right.Font = new System.Drawing.Font("微軟正黑體", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));

                // 設定每行的最小寬度,避免數量過多時候,縮得太小無法觀看.
                /*for (int col_i = 0; col_i < SM_class.strip_x_num; col_i++)
                {
                    DataGridViewColumn column_left = dataGridView_left.Columns[col_i];
                    DataGridViewColumn column_right = dataGridView_right.Columns[col_i];
                    column_left.MinimumWidth = 35;
                    column_right.MinimumWidth = 35;
                }*/


                // 隱藏抬頭第一行
                dataGridView_left.ColumnHeadersVisible = false;
                dataGridView_right.ColumnHeadersVisible = false;

                // 隱藏抬頭第一列
                dataGridView_left.RowHeadersVisible = false;
                dataGridView_right.RowHeadersVisible = false;

                // 將資料行的 FillWeight 屬性，依照它們的平均內容寬度找出適當比例，做為設定值。 
                dataGridView_left.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView_right.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                
                //所有欄位預設為文字置中
                dataGridView_left.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter; 
                dataGridView_right.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;

                //dataGridView_left.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                //dataGridView_right.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;

                dataGridView_left.AllowUserToAddRows = false;
                dataGridView_right.AllowUserToAddRows = false;

                dataGridView_left.AllowUserToDeleteRows = false;
                dataGridView_right.AllowUserToDeleteRows = false;

                // 禁止調整列寬
                dataGridView_left.AllowUserToResizeColumns = false;
                dataGridView_right.AllowUserToResizeColumns = false;

                //禁止調整行高
                dataGridView_left.AllowUserToResizeRows = false;
                dataGridView_right.AllowUserToResizeRows = false;

                // 針對個別的儲存格設定不同的字體顏色或背景顏色              
                dataGridView_left.DefaultCellStyle.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[0]));  //所有底色預設為綠色
                dataGridView_right.DefaultCellStyle.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[0]));  //所有底色預設為綠色

                dataGridView_left.RowsDefaultCellStyle.SelectionBackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[0]));  //focus cell底色預設為綠色
                dataGridView_right.RowsDefaultCellStyle.SelectionBackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[0]));  //focus cell所有底色預設為綠色

                dataGridView_left.RowsDefaultCellStyle.SelectionForeColor = Color.FromArgb(0, Color.FromArgb(0,0,0)); //focus cell 文字顏色預設為黑色
                dataGridView_right.RowsDefaultCellStyle.SelectionForeColor = Color.FromArgb(0, Color.FromArgb(0, 0, 0)); //focus cell 文字顏色預設為黑色
                #endregion

                #region 根據嚴重性設定底色
                for (int level_i = 1; level_i < SM_class.level_qty; level_i++) // Color Level
                {
                    for (int x = 0; x < SM_class.strip_x_num; x++)
                    {
                        for (int y = 0; y < SM_class.strip_y_num; y++)
                        {
                            if (SM_class.left_percent_array_dict[mode_name][x, y] >= SM_class.lower_limit_array[level_i] && SM_class.left_percent_array_dict[mode_name][x, y] <= SM_class.upper_limit_array[level_i])
                            {
                                dataGridView_left.Rows[y].Cells[x].Style.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[level_i])); //設定指定欄位cell背景顏色
                                /*if (level_i >= 1)
                                {
                                    dataGridView_left.Rows[y].Cells[x].Style.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
                                }*/
                            }
                            if (SM_class.right_percent_array_dict[mode_name][x, y] >= SM_class.lower_limit_array[level_i] && SM_class.right_percent_array_dict[mode_name][x, y] <= SM_class.upper_limit_array[level_i])
                            {
                                dataGridView_right.Rows[y].Cells[x].Style.BackColor = Color.FromArgb(255, Color.FromArgb(SM_class.color_list[level_i])); //設定指定欄位cell背景顏色
                                /*if (level_i >= 1)
                                {
                                    dataGridView_right.Rows[y].Cells[x].Style.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
                                }*/
                            }
                        }
                    }
                }
                #endregion

                /// 上述將dataGridView都設定好後,再Add進去TabPage
                TabPage_temp.Controls.Add(dataGridView_left);
                TabPage_temp.Controls.Add(dataGridView_right);

                /// 設TabPage的背景顏色
                TabPage_temp.BackColor = Color.FromArgb(15, 99, 71);

                /// 設定Title
                #region 設定Title
                /// ============================================================
                Label left_title_lab = new Label();
                left_title_lab.AutoSize = true;
                left_title_lab.Location = new System.Drawing.Point(82, 4);
                left_title_lab.Size = new System.Drawing.Size(147, 31);
                left_title_lab.Text = "左手臂(Left)";
                left_title_lab.Font = new System.Drawing.Font("微軟正黑體", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
                left_title_lab.ForeColor = System.Drawing.Color.White;
                left_title_lab.BackColor = System.Drawing.Color.Transparent;
                TabPage_temp.Controls.Add(left_title_lab);
                
                Label right_title_lab = new Label();
                right_title_lab.AutoSize = true;
                right_title_lab.Location = new System.Drawing.Point(395, 4);
                right_title_lab.Size = new System.Drawing.Size(147, 31);
                right_title_lab.Text = "右手臂(Right)";
                right_title_lab.Font = new System.Drawing.Font("微軟正黑體", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
                right_title_lab.ForeColor = System.Drawing.Color.White;
                right_title_lab.BackColor = System.Drawing.Color.Transparent;
                TabPage_temp.Controls.Add(right_title_lab);
                /// ============================================================
                 #endregion

                /// 將繪製完的TabPage加入
                tabControl1.TabPages.Add(TabPage_temp);
                SM_class.Log(String.Format("tabControl1.TabPages.Add({0})", TabPage_temp));
            }

            /// 找出壓合區塊 Piece X & Y 最大值(目的:後續要能推算出實際條的位置)
            SM_class.Find_Max_Piece_XY_Num(SM_class.log_file_path, ref BLOCK_X_SIZE, ref BLOCK_Y_SIZE);
            /// 依據BLOCK_X_SIZE, BLOCK_Y_SIZE畫出block
            gridview_drawing_block();

            SM_class.Log("Form1_Load: End\n\n");
        }

        private void button_refresh_Click(object sender, EventArgs e) //更新疊圖結果
        {
            Form1_Load(sender, e);
        }

        /// 若無C槽INI檔案,先自動創建,後續再進去修改內容.
        private void Initial_INI_File()
        {
            string dir_path = @"C:\Stack_Map_Tool\";
            string INI_file_path = @"C:\Stack_Map_Tool\parameter.ini";
            if (Directory.Exists(dir_path))
            {
                //資料夾存在
            }
            else
            {
                //新增資料夾
                Directory.CreateDirectory(dir_path);
            }
            if (File.Exists(INI_file_path)) //先判別是否有該檔案
            {
                //檔案存在
            }
            else
            {
                //新增INI檔案
                StreamWriter sw = new StreamWriter(INI_file_path);
                sw.WriteLine("[Modify_Log]");
                sw.WriteLine("DateTime = " + System.DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")); //2008-4-24 16:30:15
                sw.WriteLine("Badge = C8807");
                sw.WriteLine("[System]");
                sw.WriteLine("Online_Mode=1");
                sw.WriteLine("[File_Path]");
                sw.WriteLine(@"ETest_FirstPassRateCheck_Info = C:\Stack_Map_Tool\ETest_FirstPassRateCheck_Info.ini");
                sw.WriteLine(@"Online_Log_Dir = D:\ASEKH\C8807\g7750-2\c\log_data\log");
                sw.WriteLine(@"Online_Log_File_Name = tmp_LOG.csv");
                sw.WriteLine(@"Offline_Log_File = D:\ASEKH\C8807\g7750-2\c\log_data\log\tmp_Log.csv");
                sw.WriteLine(@"Log_Dir_Backup = C:\Stack_Map_Tool\Log_File_Backup");
                sw.WriteLine(@"Logging_Dir = C:\Stack_Map_Tool\Log");
                sw.WriteLine("[RangeValue]");
                sw.WriteLine("Range_Count = 5");
                sw.WriteLine("Upper_Limit = 20,40,60,80,100");
                sw.WriteLine("Lower_Limit = 0,21,41,61,81");
                sw.WriteLine("Color_Level1 = 0x46A932");
                sw.WriteLine("Color_Level2 = 0xFFFFC2");
                sw.WriteLine("Color_Level3 = 0xFFBF80");
                sw.WriteLine("Color_Level4 = 0xFF1F0A");
                sw.WriteLine("Color_Level5 = 0xD81313");
                sw.Close();
            }

            INI_file_path = @"C:\Stack_Map_Tool\ETest_FirstPassRateCheck_Info.ini";
            
            if (File.Exists(INI_file_path)) //先判別是否有該檔案
            {
                //檔案存在
            }
            else
            {
                //新增INI檔案
                StreamWriter sw = new StreamWriter(INI_file_path);
                sw.WriteLine("[TIME]");
                sw.WriteLine("RESET_TIME=2011-01-01 00:00:00");
                sw.Close();
            }

            dir_path = @"C:\Stack_Map_Tool\Log\";
            if (Directory.Exists(dir_path))
            {
                //資料夾存在
            }
            else
            {
                //新增資料夾
                Directory.CreateDirectory(dir_path);
            }

            dir_path = @"C:\Stack_Map_Tool\Log_File_Backup\";
            if (Directory.Exists(dir_path))
            {
                //資料夾存在
            }
            else
            {
                //新增資料夾
                Directory.CreateDirectory(dir_path);
            }
        }
        

        private void ckb_CheckedChanged(object sender, EventArgs e)
        {
            if ((sender as CheckBox).Checked == true)
            {
                foreach (CheckBox chk in (sender as CheckBox).Parent.Controls)
                {
                    if (chk != sender)
                    {
                        chk.Checked = false;
                    }
                }
                this.cal_method = int.Parse((sender as CheckBox).Tag.ToString());
            }
        }

        private void gridview_drawing_block()
        {
            foreach(TabPage page in tabControl1.TabPages)
            {
                foreach (Control control in page.Controls)
                {
                    if (control.GetType() == typeof(DataGridView))
                    {
                        (control as DataGridView).Paint += new PaintEventHandler(this.onPaint);
                    }
                }
            }
        }

        // 畫block
        private void onPaint(object sender, PaintEventArgs e)
        {
            if (sender.GetType().Name != "DataGridView") { return; }
            DataGridView dgv = (sender as DataGridView);
            Point p = dgv.Location;
            int width = dgv.Width;
            int height = dgv.Height;
            
            Graphics g = e.Graphics;
            Pen pen = new Pen(Color.Blue, 2);
            //SolidBrush redBrush = new SolidBrush(Color.Black);


            //Get the y coordination value of the top of each line  
            int top_y;// = dgv.GetCellDisplayRectangle(dgv.Columns[0].Index, dgv.Rows[4].Index, true).Y;
            //int bottom_y = dgv.GetCellDisplayRectangle(dgv.Columns[0].Index, dgv.Rows[dgv.Rows.Count - 1].Index, true).Y;


            //畫直線
            for (int i = 0; i <= dgv.Columns.Count / BLOCK_X_SIZE; i++)
            {
                //left_x = dgv.GetCellDisplayRectangle(dgv.Columns[BLOCK_X_SIZE * i].Index, dgv.Rows[0].Index, true).X;
                //g.DrawLine(pen, left_x, 0, left_x, height*2);
                g.DrawLine(pen, dgv.Columns[0].Width * BLOCK_X_SIZE * i+2, 0, dgv.Columns[0].Width * BLOCK_X_SIZE * i+2, height); //誤差2
            }
            //畫橫線
            for (int i = 0; i < dgv.RowCount / BLOCK_Y_SIZE; i++)
            {
                top_y = dgv.GetCellDisplayRectangle(dgv.Columns[0].Index, dgv.Rows[BLOCK_Y_SIZE * i].Index, true).Y;
                g.DrawLine(pen, 0, top_y, width, top_y);
                //bottom_y = dgv.GetCellDisplayRectangle(dgv.Columns[0].Index, dgv.Rows[BLOCK_Y_SIZE*i].Index, true).Y;
                //g.DrawLine(pen, 0, bottom_y, width, bottom_y);
                //g.DrawLine(pen, 0, dgv.Rows[0].Height * BLOCK_Y_SIZE * i, width, dgv.Rows[0].Height * BLOCK_Y_SIZE * i);
            }

        }
        
    }
    public class Stack_Map_Class
    {
        public Dictionary<string, int[,]> left_array_dict { get; set; }
        public Dictionary<string, int[,]> right_array_dict { get; set; }
        public Dictionary<string, int[,]> left_percent_array_dict { get; set; }
        public Dictionary<string, int[,]> right_percent_array_dict { get; set; }

        MySqlConnection conn = new MySqlConnection();

        public int[,] left_open_percent_array;
        public int[,] right_open_percent_array;
        public int[,] left_retest_percent_array;
        public int[,] right_retest_percent_array;
        public int[,] left_total_percent_array;
        public int[,] right_total_percent_array;

        public int strip_x_num;
        public int strip_y_num;

        public string lot_num;
        public string part_version;
        public DateTime start_time;
        public DateTime end_time;
        public int strip_qty;
        public string[] mode_name_list;

        public int online_mode;
        public int level_qty;
        public int[] upper_limit_array;
        public int[] lower_limit_array;
        public List<int> color_list;

        public string ETest_FirstPassRateCheck_Info_file_path;

        public string online_log_dir_path;  //結果檔案的資料夾路徑(online mode)
        public string online_log_file_name; //檔案統一名稱(online mode)
        public string offline_log_file_path; //結果檔案(offline mode)
        public string log_file_path; //結果檔案路徑
        

        public string log_dir_backup_path; //結果檔案備份資料夾路徑
        public string logging_dir_path; //log紀錄資料夾路徑

        public Stack_Map_Class() // Initial funcion (註記:名字要和class設一樣)
        {
            this.strip_x_num = 0;
            this.strip_y_num = 0;

            this.mode_name_list = new string[] { "Open Fail", "Retest Pass", "Total" };
            this.left_array_dict = new Dictionary<string, int[,]>();
            this.right_array_dict = new Dictionary<string, int[,]>();
            this.left_percent_array_dict = new Dictionary<string, int[,]>();
            this.right_percent_array_dict = new Dictionary<string, int[,]>();
            this.color_list = new List<int>();

            Read_Parameter_INI(); // 先將INI檔內設定值讀取進來
        }
        void Read_Parameter_INI()
        {
            string temp="";
            string[] str_temp_array;
            string INI_file_path = @"C:\Stack_Map_Tool\parameter.ini";
            IniFile ini = new IniFile(INI_file_path);
            //讀取INI檔值
            // [System]
            this.online_mode = int.Parse(ini.ReadIni("System", "Online_Mode")); //Online_Mode=1

            // [File_Path]
            this.ETest_FirstPassRateCheck_Info_file_path = ini.ReadIni("File_Path", "ETest_FirstPassRateCheck_Info"); //ETest_FirstPassRateCheck_Info = C:\Stack_Map_Tool\ETest_FirstPassRateCheck_Info.ini
            this.online_log_dir_path = ini.ReadIni("File_Path", "Online_Log_Dir"); //Online_Log_Dir = D:\ASEKH\C8807\g7750-2\c\log_data\log
            this.online_log_file_name = ini.ReadIni("File_Path", "Online_Log_File_Name"); //Online_Log_File_Name = tmp_LOG.csv
            this.offline_log_file_path = ini.ReadIni("File_Path", "Offline_Log_File"); //Offline_Log_File = D:\ASEKH\C8807\g7750-2\c\log_data\log\tmp_LOG.csv
            this.log_dir_backup_path = ini.ReadIni("File_Path", "Log_Dir_Backup"); // Log_Dir_Backup = C:\Stack_Map_Tool\Log_File_Backup
            this.logging_dir_path = ini.ReadIni("File_Path", "Logging_Dir"); // Logging_Dir = C:\Stack_Map_Tool\Log

            // [RangeValue]
            this.level_qty = int.Parse(ini.ReadIni("RangeValue", "Range_Count")); //Range_Count = 5

            temp = ini.ReadIni("RangeValue", "Upper_Limit");//Upper_Limit = 20,40,60,80,100
            str_temp_array = temp.Split(',');
            this.upper_limit_array = Array.ConvertAll(str_temp_array, int.Parse);

            temp = ini.ReadIni("RangeValue", "Lower_Limit");//Lower_Limit = 0,21,41,61,81
            str_temp_array = temp.Split(',');
            this.lower_limit_array = Array.ConvertAll(str_temp_array, int.Parse);

            temp = ini.ReadIni("RangeValue", "Color_Level1");//Color_Level1 = 0x46A932
            this.color_list.Add(Convert.ToInt32(temp,16));

            temp = ini.ReadIni("RangeValue", "Color_Level2");//Color_Level2 = 0xFFFFC2
            this.color_list.Add(Convert.ToInt32(temp, 16));

            temp = ini.ReadIni("RangeValue", "Color_Level3");//Color_Level3 = 0xFFBF80
            this.color_list.Add(Convert.ToInt32(temp, 16));

            temp = ini.ReadIni("RangeValue", "Color_Level4");//Color_Level4 = 0xFF1F0A
            this.color_list.Add(Convert.ToInt32(temp, 16));

            temp = ini.ReadIni("RangeValue", "Color_Level5");//Color_Level5 = 0xD81313
            this.color_list.Add(Convert.ToInt32(temp, 16));

            //Console.WriteLine("Reset time =" + ini.ReadIni("TIME", "RESET_TIME"));
        }

        public void Backup_log_file() // 備份log結果檔起來,目的:記錄當下開啟時的資料
        {
            string fileName = String.Format("{0}_{1}_Log.csv", System.DateTime.Now.ToString("yyyyMMdd_hhmmss"), this.lot_num);
            string targetPath = this.log_dir_backup_path;

            // Use Path class to manipulate file and directory paths.
            string sourceFile = this.log_file_path;
            string destFile = System.IO.Path.Combine(targetPath, fileName);

            // To copy a folder's contents to a new location:
            // Create a new target folder.
            // If the directory already exists, this method does not create a new directory.
            System.IO.Directory.CreateDirectory(targetPath);

            // To copy a file to another location and
            // overwrite the destination file if it already exists.
            System.IO.File.Copy(sourceFile, destFile, true);
        }

        public void Stack_Map_Count(int cal_method)
        {
            this.Log(String.Format("Stack_Map_Count: Start"));
            /// 讀取重置日期時間(和監控良率套件同步)
            //this.ETest_FirstPassRateCheck_Info_file_path = @"D:\ASEKH\C8807\g7750-2\c\log_data\log\ETest_FirstPassRateCheck_Info.ini";
            DateTime reset_time = Read_Reset_Time(this.ETest_FirstPassRateCheck_Info_file_path);


            /// 測試結果資料來源採用測試本機上的log紀錄檔案
            /// 路徑 : \\g7750-2\c\log_data\log
            this.log_file_path = Search_Log_File_Path(this.online_mode);
            //this.log_file_path = @"D:\ASEKH\C8807\g7750-2\c\log_data\log\M85C026V1_(Security C).csv";
            //this.log_file_path = @"D:\ASEKH\C8807\g7750-2\c\log_data\log\a1yc004v000_(Security C).csv";
            //this.log_file_path = @"D:\ASEKH\C8807\g7750-2\c\log_data\log\tmp_Log.csv"; 

            /// 解析測試結果檔案(機台當下)
            /// =======================================================
            /// 條的X,Y大小值
            /// 方法1:連線至資料庫讀取(速度快,怕連線失敗)
            /// 方法2:用裡面資訊慢慢湊出(較複雜,暫不用)
            this.lot_num = Find_Lot_Num(this.log_file_path);     // 從tmp_Log.csv檔案中讀取 lot_num
            
            this.part_version = DB_Query_Part_Version(this.lot_num);// 用lot_num 去K9 Server中資料庫讀取 part_version

            DB_Query_Part_Version_Size(this.part_version, ref this.strip_x_num, ref this.strip_y_num);// 用ref回傳查詢結果(條的X,Y大小值)
            

            /// 找出壓合區塊 Piece X & Y 最大值(目的:後續要能推算出實際條的位置)
            int piece_x_num = 0;
            int piece_y_num = 0;
            Find_Max_Piece_XY_Num(log_file_path, ref piece_x_num, ref piece_y_num);


            /// 解析測試結果檔案(機台當下)
            /// 座標為左上角為原點(X為橫軸,從1開始; Y為縱軸,從1開始)
            /// 創建Array(左右2手臂*3組=6個)
            /// Mode 1. Open Fail
            /// Mode 2. Retest Pass
            /// Mode 3. Total (Open Fail + Retest Pass)
            /// 將log結果檔案內容全數讀入DataTable中
            /// 去除不必要欄位值
            /// 統計左右手臂測試總條數
            /// 換算為百分比(%)
            //Test_Result_Count(reset_time, log_file_path, this.strip_x_num, this.strip_y_num, piece_x_num, piece_y_num);

            Test_Result_Count_by_Calculation(reset_time, log_file_path, this.strip_x_num, this.strip_y_num, piece_x_num, piece_y_num, cal_method);
        }

        
        public void Test_Result_Count(DateTime reset_time, string log_file_path, int strip_x_num, int strip_y_num, int site_max_x_num, int site_max_y_num)
        {
            this.Log(String.Format("Test_Result_Count: Start"));

            // 創建Array存放統計結果
            int[,] left_open_array = new int[strip_x_num, strip_y_num];
            int[,] right_open_array = new int[strip_x_num, strip_y_num];
            int[,] left_retest_array = new int[strip_x_num, strip_y_num];
            int[,] right_retest_array = new int[strip_x_num, strip_y_num];
            int[,] left_total_array = new int[strip_x_num, strip_y_num];
            int[,] right_total_array = new int[strip_x_num, strip_y_num];


            int left_open_unit_fail_qty = 0;
            int right_open_unit_fail_qty = 0;
            int left_retest_unit_fail_qty = 0;
            int right_retest_unit_fail_qty = 0;
            int left_total_unit_fail_qty = 0;
            int right_total_unit_fail_qty = 0;

            int left_strip_qty = 0;
            int right_strip_qty = 0;
            int serial_num_temp = 0;
            this.start_time = DateTime.MaxValue;
            this.end_time = DateTime.MinValue;

            bool isFirst = true;
            using (FileStream fs = new FileStream(log_file_path, FileMode.Open, FileAccess.Read))
            {
                using (StreamReader sr = new StreamReader(fs, Encoding.Default))
                {
                    while (!sr.EndOfStream)
                    {
                        var line = sr.ReadLine();

                        string[] sArray = line.Split(',');

                        //exclude first line
                        if (isFirst) //欄位跳過
                        {
                            isFirst = false;
                            continue;
                        }
                        //split string to array of string use seperator
                        DateTime datetime = DateTime.MinValue;
                        int serial_num = 0;
                        int stage_num = 0;
                        int block_x_num = 0;
                        int block_y_num = 0;
                        int piece_x_num = 0;
                        int piece_y_num = 0;
                        string piece_judge = string.Empty;
                        string item = string.Empty;
                        int testing_counter = 0;
                        string date_temp = string.Empty;
                        string time_temp = string.Empty;

                        // 擷取所需欄位資訊
                        // =============================================================================================
                        if (sArray[15] == "" || sArray[16] == "") //常缺值; 
                        {
                            continue;
                        }
                        // 補充: 能預料的bug就提前控制處理，不能預料的再try / catch捕獲
                        try //用來防止其他欄位轉換出錯(少見)
                        {
                            date_temp = sArray[0]; //Date
                            time_temp = sArray[1]; //Time
                            serial_num = int.Parse(sArray[4]); //Serial
                            datetime = Convert.ToDateTime(String.Format("{0} {1}", date_temp, time_temp)); //合併日期時間
                            piece_judge = sArray[9]; //Piece Judge
                            stage_num = int.Parse(sArray[10]); //Stage 1:左手臂; 2:右手臂
                            block_x_num = int.Parse(sArray[12]); //BlockX
                            block_y_num = int.Parse(sArray[13]); //BlockY
                            piece_x_num = int.Parse(sArray[15]); //PieceX
                            piece_y_num = int.Parse(sArray[16]); //PieceY
                            item = sArray[17]; //Item
                            testing_counter = int.Parse(sArray[18]); //Testing counter
                        }
                        catch
                        {
                            continue;
                        }
                        // =============================================================================================


                        int x = 0;
                        int y = 0;
                        if (datetime >= reset_time) //重置時間後才納入(和FA單位開發程式同步)
                        {
                            x = (block_x_num - 1) * site_max_x_num + piece_x_num;
                            y = (block_y_num - 1) * site_max_y_num + piece_y_num;

                            if (x > strip_x_num)// 特殊: 有可能壓合時避免超出strip會拉回一格
                            {
                                x--;
                            }
                            if (y > strip_y_num)// 特殊: 有可能壓合時避免超出strip會拉回一格
                            {
                                y--;
                            }

                            // 判斷是否fail至陣列Count
                            // ========================================================================
                            if (stage_num == 1)//左手臂
                            {
                                if (piece_judge == "OPEN" && piece_judge != string.Empty) //piece_judge不為空值
                                {
                                    left_open_array[x - 1, y - 1]++; //該位置統計值+1
                                    left_open_unit_fail_qty++;
                                }
                                else if (testing_counter <= 5 && testing_counter >= 2 && piece_judge == "PASS") // Retest 判定要篩選 Total press counter 的  " 2 、3、4、5 " 且再篩選 Piece Judge 的  " PASS " 
                                {
                                    left_retest_array[x - 1, y - 1]++; //該位置統計值+1
                                    left_retest_unit_fail_qty++;
                                }
                            }
                            else if (stage_num == 2)//右手臂
                            {
                                if (piece_judge == "OPEN" && piece_judge != string.Empty) //piece_judge不為空值
                                {
                                    right_open_array[x - 1, y - 1]++; //該位置統計值+1
                                    right_open_unit_fail_qty++;
                                }
                                else if (testing_counter <= 5 && testing_counter >= 2 && piece_judge == "PASS") // Retest 判定要篩選 Total press counter 的  " 2 、3、4、5 " 且再篩選 Piece Judge 的  " PASS "
                                {
                                    right_retest_array[x - 1, y - 1]++; //該位置統計值+1
                                    right_retest_unit_fail_qty++;
                                }
                            }

                            
                            // 紀錄左右手臂量測片數
                            // ========================================================================
                            // 新的Serial和舊的相比較不同,代表已換條.
                            // 注意:不能只比較stage,因為有可能會連續同一邊測試兩次.
                            if (serial_num_temp != serial_num) 
                            {
                                if (stage_num == 1)//左手臂
                                {
                                    left_strip_qty++;
                                    serial_num_temp = serial_num;
                                    //Console.WriteLine("left_strip_qty: {0}", left_strip_qty);
                                }
                                else if (stage_num == 2)//右手臂
                                {
                                    right_strip_qty++;
                                    serial_num_temp = serial_num;
                                    //Console.WriteLine("right_strip_qty: {0}", right_strip_qty);
                                }
                            }
                            if(this.start_time > datetime)
                            {
                                this.start_time = datetime;
                            }
                            if (this.end_time < datetime)
                            {
                                this.end_time = datetime;
                            }
                        }
                    }
                }
            }
            this.strip_qty = left_strip_qty + right_strip_qty; //總條數相加
            left_total_unit_fail_qty = left_open_unit_fail_qty + left_retest_unit_fail_qty;
            right_total_unit_fail_qty = right_open_unit_fail_qty + right_retest_unit_fail_qty;

            // 創建Array存放統計結果
            this.left_open_percent_array = new int[strip_x_num, strip_y_num];
            this.right_open_percent_array = new int[strip_x_num, strip_y_num];
            this.left_retest_percent_array = new int[strip_x_num, strip_y_num];
            this.right_retest_percent_array = new int[strip_x_num, strip_y_num];
            this.left_total_percent_array = new int[strip_x_num, strip_y_num];
            this.right_total_percent_array = new int[strip_x_num, strip_y_num];

            
            for (int x = 0; x < strip_x_num; x++)
            {
                for (int y = 0; y < strip_y_num; y++)
                {
                    // 將 Open Fail 和 Retest Pass 2D array相加(相同位置相加)
                    left_total_array[x, y] = left_open_array[x, y] + left_retest_array[x, y];
                    right_total_array[x, y] = right_open_array[x, y] + right_retest_array[x, y];

                    /*left_open_unit_fail_qty = 100;
                    right_open_unit_fail_qty = 100;
                    left_retest_unit_fail_qty = 100;
                    right_retest_unit_fail_qty = 100;
                    left_total_unit_fail_qty = 100;
                    right_total_unit_fail_qty = 100;*/

                    // 換算為% 
                    // 注意:不能整數直接相除,得先轉為double
                    // open
                    this.left_open_percent_array[x, y] = (int)Math.Round((double)left_open_array[x, y] / left_open_unit_fail_qty * 100.0, 0);
                    this.right_open_percent_array[x, y] = (int)Math.Round((double)right_open_array[x, y] / right_open_unit_fail_qty * 100.0, 0);
                    // retest
                    this.left_retest_percent_array[x, y] = (int)Math.Round((double)left_retest_array[x, y] / left_retest_unit_fail_qty * 100.0, 0);
                    this.right_retest_percent_array[x, y] = (int)Math.Round((double)right_retest_array[x, y] / right_retest_unit_fail_qty * 100.0, 0);
                    // total
                    this.left_total_percent_array[x, y] = (int)Math.Round((double)left_total_array[x, y] / left_total_unit_fail_qty * 100.0, 0);
                    this.right_total_percent_array[x, y] = (int)Math.Round((double)right_total_array[x, y] / right_total_unit_fail_qty * 100.0, 0);
                }
            }
            this.left_array_dict.Clear();
            this.left_array_dict.Add("Open Fail", left_open_array);
            this.left_array_dict.Add("Retest Pass", left_retest_array);
            this.left_array_dict.Add("Total", left_total_array);

            this.right_array_dict.Clear();
            this.right_array_dict.Add("Open Fail", right_open_array);
            this.right_array_dict.Add("Retest Pass", right_retest_array);
            this.right_array_dict.Add("Total", right_total_array);

            this.left_percent_array_dict.Clear();
            this.left_percent_array_dict.Add("Open Fail", this.left_open_percent_array);
            this.left_percent_array_dict.Add("Retest Pass", this.left_retest_percent_array);
            this.left_percent_array_dict.Add("Total", this.left_total_percent_array);

            this.right_percent_array_dict.Clear();
            this.right_percent_array_dict.Add("Open Fail", this.right_open_percent_array);
            this.right_percent_array_dict.Add("Retest Pass", this.right_retest_percent_array);
            this.right_percent_array_dict.Add("Total", this.right_total_percent_array);

            this.Log(String.Format("Test_Result_Count: End"));
        }
        

        public void Test_Result_Count_by_Calculation(DateTime reset_time, string log_file_path, int strip_x_num, int strip_y_num, int site_max_x_num, int site_max_y_num, int cal_method)
        {
            this.Log(String.Format("Test_Result_Count: Start"));

            // 創建Array存放統計結果
            int[,] left_open_array = new int[strip_x_num, strip_y_num];
            int[,] right_open_array = new int[strip_x_num, strip_y_num];
            int[,] left_retest_array = new int[strip_x_num, strip_y_num];
            int[,] right_retest_array = new int[strip_x_num, strip_y_num];
            int[,] left_total_array = new int[strip_x_num, strip_y_num];
            int[,] right_total_array = new int[strip_x_num, strip_y_num];

            int left_max_open_num = 0;
            int right_max_open_num = 0;
            int left_max_retest_num = 0;
            int right_max_retest_num = 0;
            int left_max_total_num = 0;
            int right_max_total_num = 0;

            int left_open_unit_fail_qty = 0;
            int right_open_unit_fail_qty = 0;
            int left_retest_unit_fail_qty = 0;
            int right_retest_unit_fail_qty = 0;
            int left_total_unit_fail_qty = 0;
            int right_total_unit_fail_qty = 0;

            int left_strip_qty = 0;
            int right_strip_qty = 0;
            int serial_num_temp = 0;
            this.start_time = DateTime.MaxValue;
            this.end_time = DateTime.MinValue;

            bool isFirst = true;
            using (FileStream fs = new FileStream(log_file_path, FileMode.Open, FileAccess.Read))
            {
                using (StreamReader sr = new StreamReader(fs, Encoding.Default))
                {
                    while (!sr.EndOfStream)
                    {
                        var line = sr.ReadLine();

                        string[] sArray = line.Split(',');

                        //exclude first line
                        if (isFirst) //欄位跳過
                        {
                            isFirst = false;
                            continue;
                        }
                        //split string to array of string use seperator
                        DateTime datetime = DateTime.MinValue;
                        int serial_num = 0;
                        int stage_num = 0;
                        int block_x_num = 0;
                        int block_y_num = 0;
                        int piece_x_num = 0;
                        int piece_y_num = 0;
                        string piece_judge = string.Empty;
                        string item = string.Empty;
                        int testing_counter = 0;
                        string date_temp = string.Empty;
                        string time_temp = string.Empty;

                        // 擷取所需欄位資訊
                        // =============================================================================================
                        if (sArray[15] == "" || sArray[16] == "") //常缺值; 
                        {
                            continue;
                        }
                        // 補充: 能預料的bug就提前控制處理，不能預料的再try / catch捕獲
                        try //用來防止其他欄位轉換出錯(少見)
                        {
                            date_temp = sArray[0]; //Date
                            time_temp = sArray[1]; //Time
                            serial_num = int.Parse(sArray[4]); //Serial
                            datetime = Convert.ToDateTime(String.Format("{0} {1}", date_temp, time_temp)); //合併日期時間
                            piece_judge = sArray[9]; //Piece Judge
                            stage_num = int.Parse(sArray[10]); //Stage 1:左手臂; 2:右手臂
                            block_x_num = int.Parse(sArray[12]); //BlockX
                            block_y_num = int.Parse(sArray[13]); //BlockY
                            piece_x_num = int.Parse(sArray[15]); //PieceX
                            piece_y_num = int.Parse(sArray[16]); //PieceY
                            item = sArray[17]; //Item
                            testing_counter = int.Parse(sArray[18]); //Testing counter
                        }
                        catch
                        {
                            continue;
                        }
                        // =============================================================================================


                        int x = 0;
                        int y = 0;
                        if (datetime >= reset_time) //重置時間後才納入(和FA單位開發程式同步)
                        {
                            x = (block_x_num - 1) * site_max_x_num + piece_x_num;
                            y = (block_y_num - 1) * site_max_y_num + piece_y_num;

                            if (x > strip_x_num)// 特殊: 有可能壓合時避免超出strip會拉回一格
                            {
                                x--;
                            }
                            if (y > strip_y_num)// 特殊: 有可能壓合時避免超出strip會拉回一格
                            {
                                y--;
                            }

                            // 判斷是否fail至陣列Count
                            // ========================================================================
                            if (stage_num == 1)//左手臂
                            {
                                if (piece_judge == "OPEN" && piece_judge != string.Empty) //piece_judge不為空值
                                {
                                    left_open_array[x - 1, y - 1]++; //該位置統計值+1
                                    if (left_open_array[x - 1, y - 1] > left_max_open_num)
                                    {
                                        left_max_open_num = left_open_array[x - 1, y - 1];
                                    }
                                    left_open_unit_fail_qty++;
                                }
                                else if (testing_counter <= 5 && testing_counter >= 2 && piece_judge == "PASS") // Retest 判定要篩選 Total press counter 的  " 2 、3、4、5 " 且再篩選 Piece Judge 的  " PASS " 
                                {
                                    left_retest_array[x - 1, y - 1]++; //該位置統計值+1
                                    if (left_retest_array[x - 1, y - 1] > left_max_retest_num)
                                    {
                                        left_max_retest_num = left_retest_array[x - 1, y - 1];
                                    }
                                    left_retest_unit_fail_qty++;
                                }
                                if (left_open_array[x - 1, y - 1]  + left_retest_array[x - 1, y - 1] > left_max_total_num)
                                {
                                    left_max_total_num = left_open_array[x - 1, y - 1] + left_retest_array[x - 1, y - 1];
                                }
                            }
                            else if (stage_num == 2)//右手臂
                            {
                                if (piece_judge == "OPEN" && piece_judge != string.Empty) //piece_judge不為空值
                                {
                                    right_open_array[x - 1, y - 1]++; //該位置統計值+1
                                    if (right_open_array[x - 1, y - 1] > right_max_open_num)
                                    {
                                        right_max_open_num = right_open_array[x - 1, y - 1];
                                    }
                                    right_open_unit_fail_qty++;
                                }
                                else if (testing_counter <= 5 && testing_counter >= 2 && piece_judge == "PASS") // Retest 判定要篩選 Total press counter 的  " 2 、3、4、5 " 且再篩選 Piece Judge 的  " PASS "
                                {
                                    right_retest_array[x - 1, y - 1]++; //該位置統計值+1
                                    if (right_retest_array[x - 1, y - 1] > right_max_retest_num)
                                    {
                                        right_max_retest_num = right_retest_array[x - 1, y - 1];
                                    }
                                    right_retest_unit_fail_qty++;
                                }

                                if (right_open_array[x - 1, y - 1] + right_retest_array[x - 1, y - 1] > right_max_total_num)
                                {
                                    right_max_total_num = right_open_array[x - 1, y - 1] + right_retest_array[x - 1, y - 1];
                                }
                            }


                            // 紀錄左右手臂量測片數
                            // ========================================================================
                            // 新的Serial和舊的相比較不同,代表已換條.
                            // 注意:不能只比較stage,因為有可能會連續同一邊測試兩次.
                            if (serial_num_temp != serial_num)
                            {
                                if (stage_num == 1)//左手臂
                                {
                                    left_strip_qty++;
                                    serial_num_temp = serial_num;
                                    //Console.WriteLine("left_strip_qty: {0}", left_strip_qty);
                                }
                                else if (stage_num == 2)//右手臂
                                {
                                    right_strip_qty++;
                                    serial_num_temp = serial_num;
                                    //Console.WriteLine("right_strip_qty: {0}", right_strip_qty);
                                }
                            }
                            if (this.start_time > datetime)
                            {
                                this.start_time = datetime;
                            }
                            if (this.end_time < datetime)
                            {
                                this.end_time = datetime;
                            }
                        }
                    }
                }
            }
            this.strip_qty = left_strip_qty + right_strip_qty; //總條數相加
            left_total_unit_fail_qty = left_open_unit_fail_qty + left_retest_unit_fail_qty;
            right_total_unit_fail_qty = right_open_unit_fail_qty + right_retest_unit_fail_qty;

            // 創建Array存放統計結果
            this.left_open_percent_array = new int[strip_x_num, strip_y_num];
            this.right_open_percent_array = new int[strip_x_num, strip_y_num];
            this.left_retest_percent_array = new int[strip_x_num, strip_y_num];
            this.right_retest_percent_array = new int[strip_x_num, strip_y_num];
            this.left_total_percent_array = new int[strip_x_num, strip_y_num];
            this.right_total_percent_array = new int[strip_x_num, strip_y_num];


            for (int x = 0; x < strip_x_num; x++)
            {
                for (int y = 0; y < strip_y_num; y++)
                {
                    // 將 Open Fail 和 Retest Pass 2D array相加(相同位置相加)
                    left_total_array[x, y] = left_open_array[x, y] + left_retest_array[x, y];
                    right_total_array[x, y] = right_open_array[x, y] + right_retest_array[x, y];

                    /*left_open_unit_fail_qty = 100;
                    right_open_unit_fail_qty = 100;
                    left_retest_unit_fail_qty = 100;
                    right_retest_unit_fail_qty = 100;
                    left_total_unit_fail_qty = 100;
                    right_total_unit_fail_qty = 100;*/

                    if (cal_method == 1)
                    {
                        // 換算為% 
                        // 注意:不能整數直接相除,得先轉為double
                        // open
                        this.left_open_percent_array[x, y] = (int)Math.Round((double)left_open_array[x, y] / left_open_unit_fail_qty * 100.0, 0);
                        this.right_open_percent_array[x, y] = (int)Math.Round((double)right_open_array[x, y] / right_open_unit_fail_qty * 100.0, 0);
                        // retest
                        this.left_retest_percent_array[x, y] = (int)Math.Round((double)left_retest_array[x, y] / left_retest_unit_fail_qty * 100.0, 0);
                        this.right_retest_percent_array[x, y] = (int)Math.Round((double)right_retest_array[x, y] / right_retest_unit_fail_qty * 100.0, 0);
                        // total
                        this.left_total_percent_array[x, y] = (int)Math.Round((double)left_total_array[x, y] / left_total_unit_fail_qty * 100.0, 0);
                        this.right_total_percent_array[x, y] = (int)Math.Round((double)right_total_array[x, y] / right_total_unit_fail_qty * 100.0, 0);
                    }
                    else if (cal_method == 2)
                    {
                        // open
                        this.left_open_percent_array[x, y] = (int)Math.Round((double)left_open_array[x, y] / left_strip_qty * 100.0, 0);
                        this.right_open_percent_array[x, y] = (int)Math.Round((double)right_open_array[x, y] / right_strip_qty * 100.0, 0);
                        // retest
                        this.left_retest_percent_array[x, y] = (int)Math.Round((double)left_retest_array[x, y] / left_strip_qty * 100.0, 0);
                        this.right_retest_percent_array[x, y] = (int)Math.Round((double)right_retest_array[x, y] / right_strip_qty * 100.0, 0);
                        // total
                        this.left_total_percent_array[x, y] = (int)Math.Round((double)left_total_array[x, y] / left_strip_qty * 100.0, 0);
                        this.right_total_percent_array[x, y] = (int)Math.Round((double)right_total_array[x, y] / right_strip_qty * 100.0, 0);
                    }
                    else// if (cal_method == 3)
                    {
                        // open
                        this.left_open_percent_array[x, y] = (int)Math.Round((double)left_open_array[x, y] / left_max_open_num * 100.0, 0);
                        this.right_open_percent_array[x, y] = (int)Math.Round((double)right_open_array[x, y] / right_max_open_num * 100.0, 0);
                        // retest
                        this.left_retest_percent_array[x, y] = (int)Math.Round((double)left_retest_array[x, y] / left_max_retest_num * 100.0, 0);
                        this.right_retest_percent_array[x, y] = (int)Math.Round((double)right_retest_array[x, y] / right_max_retest_num * 100.0, 0);
                        // total
                        this.left_total_percent_array[x, y] = (int)Math.Round((double)left_total_array[x, y] / left_max_total_num * 100.0, 0);
                        this.right_total_percent_array[x, y] = (int)Math.Round((double)right_total_array[x, y] / right_max_total_num * 100.0, 0);
                    }
                }
            }
            this.left_array_dict.Clear();
            this.left_array_dict.Add("Open Fail", left_open_array);
            this.left_array_dict.Add("Retest Pass", left_retest_array);
            this.left_array_dict.Add("Total", left_total_array);

            this.right_array_dict.Clear();
            this.right_array_dict.Add("Open Fail", right_open_array);
            this.right_array_dict.Add("Retest Pass", right_retest_array);
            this.right_array_dict.Add("Total", right_total_array);

            this.left_percent_array_dict.Clear();
            this.left_percent_array_dict.Add("Open Fail", this.left_open_percent_array);
            this.left_percent_array_dict.Add("Retest Pass", this.left_retest_percent_array);
            this.left_percent_array_dict.Add("Total", this.left_total_percent_array);

            this.right_percent_array_dict.Clear();
            this.right_percent_array_dict.Add("Open Fail", this.right_open_percent_array);
            this.right_percent_array_dict.Add("Retest Pass", this.right_retest_percent_array);
            this.right_percent_array_dict.Add("Total", this.right_total_percent_array);

            this.Log(String.Format("Test_Result_Count: End"));
        }
        

        public void Log(string message)
        {
            string logging_file_path = string.Format(@"{0}\{1}",logging_dir_path, System.DateTime.Now.ToString("yyyy_MM_dd")+ "_logging_file.log");

            if (!Directory.Exists(this.logging_dir_path))
                Directory.CreateDirectory(this.logging_dir_path);

            if (!File.Exists(logging_file_path))
            {
                // The File.Create method creates the file and opens a FileStream on the file. You neeed to close it.
                File.Create(logging_file_path).Close();
            }
            using (StreamWriter sw = File.AppendText(logging_file_path))
            {
                sw.WriteLine("{0}:{1}", System.DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"), message);
            }
        }

        public string DB_Query_Part_Version(string lot_num)
        {
            connect_DB("10.16.22.228", "hlsystem_aoi", "5910", "5910");
            string query_command = string.Empty;
            string part_version = string.Empty;

            MySqlCommand cmd;
            MySqlDataReader reader;
            //預設連線資料庫
            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //例外的處理方法，顯示警告
                this.Log(String.Format("資料庫連線失敗!!!"));
                throw new ArgumentException(String.Format("資料庫連線失敗!!!"));
            }

            // 用批號查出對應料號板序
            // ====================================================================================================
            query_command = string.Format("SELECT `model_num` FROM `lotlist` WHERE `lot_num` = '{0}'", lot_num);
            try
            {
                cmd = new MySqlCommand(query_command, conn);
                reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                {
                    //如果沒有資料,顯示沒有資料的訊息
                    this.Log(String.Format("找不到該料號板序資料"));
                    throw new ArgumentException(String.Format("找不到該料號板序資料"));
                }
                else
                {
                    while (reader.Read())
                    {
                        part_version = reader.GetString(0);
                        this.Log(String.Format("DB_Query_Part_Version: part_version = {0}", part_version));
                        //Console.WriteLine("Part_Version: {0}", part_version);
                    }
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                this.Log(String.Format("用批號查料號板序資料錯誤-SQL:{0}", query_command));
                throw new ArgumentException(String.Format("用批號查料號板序資料錯誤-SQL:{0}", query_command));
            }

            conn.Close();
            return part_version;
        }
        public void DB_Query_Part_Version_Size(string part_version, ref int strip_x_num, ref int strip_y_num)
        {
            connect_DB("10.16.22.228", "hlsystem_common", "5910", "5910");
            string query_command = string.Empty;

            MySqlCommand cmd;
            MySqlDataReader reader;
            //預設連線資料庫
            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //例外的處理方法，顯示警告
                this.Log(String.Format("資料庫連線失敗!!!"));
                throw new ArgumentException(String.Format("資料庫連線失敗!!!"));
            }

            // 用料號板序查出條的Size大小
            // ====================================================================================================
            query_command = string.Format("SELECT `Strip_X_Num`,`Strip_Y_Num` FROM `xy_refer_file` WHERE `Part_Num` = '{0}'", part_version);
            try
            {
                cmd = new MySqlCommand(query_command, conn);
                reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                {
                    //如果沒有資料,顯示沒有資料的訊息
                }
                else
                {
                    while (reader.Read())
                    {
                        strip_x_num = reader.GetInt16(0);
                        strip_y_num = reader.GetInt16(1);
                        //Console.WriteLine("strip_x_num: {0}", strip_x_num);
                        //Console.WriteLine("strip_y_num: {0}", strip_y_num);
                    }
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                this.Log(String.Format("用料號板序查條X,Y錯誤-SQL:{0}", query_command));
                throw new ArgumentException(String.Format("用料號板序查條X,Y錯誤-SQL:{0}", query_command));
            }
            // 註解: 由於GATS機台上面測試時,會直放條,所以Y必須要大於X.
            /*if(strip_x_num > strip_y_num)
            {
                int num_temp = strip_x_num;
                strip_x_num = strip_y_num;
                strip_y_num = num_temp;
            }*/

            this.Log(String.Format("DB_Query_Part_Version_Size: strip_x_num = {0} strip_y_num = {1}", strip_x_num, strip_y_num));
            conn.Close();
        }

        public string Search_Log_File_Path(int online_mode)
        {
            string log_file_path = string.Empty;
            this.Log(String.Format("Search_Log_File_Path: Start"));
            this.Log(String.Format("online_mode: {0}", online_mode));

            //先判斷要讀取哪個模式路徑
            if(online_mode == 1) //產線
            {
                // 找出該資料夾路徑中,日期時間最新的資料夾.
                // 再從資料夾內中找出log_file
                // 程式:LINQ 可以做，以下範例是將 D:\TEST 內的子資料夾，使用 LastAccessTime 做大到小排序
                var dirList = (from d in new System.IO.DirectoryInfo(this.online_log_dir_path).GetDirectories()
                               select d).ToList().OrderByDescending(d => d.LastAccessTime);

                foreach (var sub_dir in dirList)
                {
                    log_file_path = System.IO.Path.Combine(this.online_log_dir_path, sub_dir.Name, this.online_log_file_name);
                    break;
                }
            }
            else if(online_mode == 0) //辦公室
            {
                log_file_path = this.offline_log_file_path;
            }
            else
            {
                this.Log(String.Format("Find_Log_File_Path() 錯誤-online_mode:{0}", online_mode));
                throw new ArgumentException(String.Format("Find_Log_File_Path() 錯誤-online_mode:{0}", online_mode));
            }

            if (File.Exists(log_file_path)) //先判別是否有該檔案
            {
                this.Log(String.Format("Search_Log_File_Path: log_file_path = {0}", log_file_path));
            }
            else
            {
                this.Log(String.Format("檔案缺失: log_file_path = {0}", log_file_path));
                throw new ArgumentException(String.Format("檔案缺失: log_file_path = {0}", log_file_path));
            }
            
            this.Log(String.Format("Search_Log_File_Path: End"));
            return log_file_path;
        }

        public string Find_Lot_Num(string log_file_path)
        {
            this.Log(String.Format("Find_Lot_Num: Start"));
            this.Log(String.Format("log_file_path: {0}", log_file_path));
            string lot_num = string.Empty;
            string line;
            int count = 0;
            int lot_num_address = 0;
            System.IO.StreamReader file = new System.IO.StreamReader(log_file_path);
            if (File.Exists(log_file_path)) //先判別是否有該檔案
            {
                while ((line = file.ReadLine()) != null)
                {
                    //System.Console.WriteLine(line);
                    if (count == 0) //讀取到抬頭資料,從中取出lot_num的位置
                    {
                        string[] sArray = line.Split(',');
                        foreach (string temp in sArray)
                        {
                            string str_temp = temp.Trim('"');
                            if (str_temp.Equals("LotNo"))
                            {
                                this.Log(String.Format("Find_Lot_Num: LotNo"));
                                this.Log(String.Format("Find_Lot_Num: lot_num_address={0}", lot_num_address));
                                break;
                            }
                            lot_num_address++;
                        }
                    }
                    else if (count == 1) //讀取到第一筆資料,從中取出lot_num
                    {
                        //lot_num_address = 7;
                        string[] sArray = line.Split(',');
                        lot_num = sArray[lot_num_address];
                        break;
                    }
                    count++;
                }
                file.Close();
                this.Log(String.Format("Find_Lot_Num: lot_num = {0}", lot_num));
            }
            else
            {
                this.Log(String.Format("檔案缺失: log_file_path = {0}", log_file_path));
                throw new ArgumentException(String.Format("檔案缺失: log_file_path = {0}", log_file_path));
            }
            this.Log(String.Format("Find_Lot_Num: End"));
            return lot_num;
        }

        public void Find_Max_Piece_XY_Num(string log_file_path, ref int piece_x_num, ref int piece_y_num)
        {
            piece_x_num = 0;
            piece_y_num = 0;
            string lot_num = string.Empty;
            string line;
            string[] sArray;
            int piece_x_address = 0;
            int piece_y_address = 0;
            int x_temp = 0;
            int y_temp = 0;
            bool isFirst = true;
            int cnt = 0;
            if (File.Exists(log_file_path)) //先判別是否有該檔案
            {
                System.IO.StreamReader file = new System.IO.StreamReader(log_file_path);
                while ((line = file.ReadLine()) != null)
                {
                    //System.Console.WriteLine(line);
                    if (isFirst) //讀取到抬頭資料,從中取出"PieceX"欄位的位置
                    {
                        sArray = line.Split(',');
                        foreach (string temp in sArray)
                        {
                            string str_temp = temp.Trim('"');
                            if (str_temp.Equals("PieceX"))
                            {
                                piece_y_address = piece_x_address + 1; // 由於"PieceY"在右邊一欄
                                break;
                            }
                            piece_x_address++;
                        }
                        isFirst = false;
                        continue;
                    }

                    try // 程式主執行區或可能發生錯誤的地方
                    {
                        // 拆解各行內容, 統計出Block X/Y 最大值為何
                        sArray = line.Split(',');

                        x_temp = int.Parse(sArray[piece_x_address]);
                        y_temp = int.Parse(sArray[piece_y_address]);
                    }
                    catch //例外的處理方法
                    {
                        cnt++;
                        continue; //直接換下一行拆解
                    }

                    if (x_temp > piece_x_num)
                    {
                        piece_x_num = x_temp;
                    }
                    if (y_temp > piece_y_num)
                    {
                        piece_y_num = y_temp;
                    }
                    cnt++;

                    if (cnt > 50) //不用全部資料全掃完,最多掃個50行即可統計好.(避免整份檔案掃完花費過多時間)
                    {
                        break;
                    }
                }
                file.Close();
                this.Log(String.Format("Find_Max_Piece_XY_Num: piece_x_num = {0} piece_y_num = {1}", piece_x_num, piece_y_num));
            }
            else
            {
                this.Log(String.Format("檔案缺少:{0}", log_file_path));
            }
        }





        public void connect_DB(string ServerIP, string DatabaseName,  string UserName, string Password)
        {
            if (conn != null)
            {
                conn.Close();
            }
            string connstring = string.Format("Server={0}; database={1}; UID={2}; password={3}; CharSet=utf8;", ServerIP, DatabaseName, UserName, Password);
            conn = new MySqlConnection(connstring);

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                this.Log(String.Format("資料庫連線失敗:{0}", connstring));
                throw new ArgumentException(String.Format("資料庫連線失敗!!!"));
                //Console.WriteLine(ex.Message);
            }
            conn.Close();
        }

        public DateTime Read_Reset_Time(string reset_time_file_path)
        {
            DateTime reset_time = new DateTime();
            if (File.Exists(reset_time_file_path)) //先判別是否有該檔案
            {
                IniFile ini = new IniFile(reset_time_file_path);
                //讀取 Ini 中 RESET_TIME 的值
                reset_time = Convert.ToDateTime(ini.ReadIni("TIME", "RESET_TIME"));
                //Console.WriteLine("Reset time =" + ini.ReadIni("TIME", "RESET_TIME"));
            }
            this.Log(String.Format("reset_time = {0}", reset_time));
            return reset_time;
        }
        


        /// for read ini file c#沒有內建讀取ini檔案的程式碼
        public class IniFile
        {

            [DllImport("kernel32")]
            private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);

            [DllImport("kernel32")]
            private static extern int GetPrivateProfileString(string section, string key, string def, StringBuilder retVal, int size, string filePath);

            private string filepath;
            public IniFile(string filepath)
            {
                this.filepath = filepath;
            }

            public void WriteIni(string section, string key, string val)
            {
                WritePrivateProfileString(section, key, val, filepath);
            }

            public string ReadIni(string section, string key)
            {
                StringBuilder temp = new StringBuilder(255);
                GetPrivateProfileString(section, key, "", temp, 255, filepath);
                return temp.ToString();
            }
        }
        
    }
}
