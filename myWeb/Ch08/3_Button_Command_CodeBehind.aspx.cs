using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_3_Button_Command_CodeBehind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void CommandBtn_Click(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Sort":
                Sort_List((String)e.CommandArgument);
                break;

            default:
                // The command name is not recognized. Display an error message.
                Message.Text = "你按下哪個按鈕？我不認得～.";
                break;
        }
    }

    protected void Sort_List(string commandArgument)
    {
        switch (commandArgument)
        {
            case "Ascending":
                Message.Text = "你按下「排序」的按鈕！CommandArgument為 Ascending";
                break;

            case "Descending":
                Message.Text = "你按下「反排序」的按鈕！ CommandArgument為 Descending ";
                break;
        }
    }


}