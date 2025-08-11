using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_TextBox_Password_Strength : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        int password_strength = 0;

        if (TextBox1.Text.Length > 3)     
        {   //-- 密碼長度超過三個字
            password_strength++;
        }
        //**********************************************
        //*** 沿用（上集）第十八章 FileUpload的範例。 ***
        //-- 註解：用「字串陣列」來存放允許輸入的密碼。
        string[] allowedNumber = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

        for (int i = 0; i < allowedNumber.Length; i++)
        {
            if (TextBox1.Text.IndexOf(allowedNumber[i]) >= 0)    {
                password_strength++;
                break;   //-- 離開 for迴圈
            }
        }

        string[] allowedSignal = { "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")" };

        for (int j = 0; j < allowedSignal.Length; j++)
        {
            if (TextBox1.Text.IndexOf(allowedSignal[j]) >= 0)   {
                password_strength++;
                break;   //-- 離開 for迴圈
            }
        }

        switch (password_strength)
        {
            case 0:
                Response.Write("<h3><font color=red>密碼強度不足！至少需要三個字以上！</font></h3>");
                break;
            case 1:   //-- 強度低
                Image1.ImageUrl = @"MIS2000Lab_book_image\Password_01.jpg";
                //-- C#對於反斜線（\）的符號有特殊用法，是一個保留字！
                //-- 或是寫成 Image1.ImageUrl = "MIS2000Lab_book_image\\Password_01.jpg";
                break;
            case 2:   //-- 強度中
                Image1.ImageUrl = "MIS2000Lab_book_image\\Password_02.jpg";
                break;
            case 3:   //-- 強度高
                Image1.ImageUrl = "MIS2000Lab_book_image\\Password_03.jpg";
                break;
            default:
                break;
        }

    }
}