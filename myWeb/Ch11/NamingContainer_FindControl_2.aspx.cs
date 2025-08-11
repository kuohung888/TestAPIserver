using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_NamingContainer_FindControl_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow myCurrentRow = GridView1.SelectedRow;

        // Display the UniqueID.
        Label1.Text = "The UniqueID is : <b>" + ((Control)(myCurrentRow.Controls[0])).UniqueID;
        Label1.Text += "</b><br />UniqueID。表示你按下--第幾列，第幾格GridViewRow的Controls[0]的UniqueID（並非從零算起）";
        Label1.Text += "<br />GridViewRow的Controls[0]的的型態：" + myCurrentRow.Controls[0].ToString();

        //---------------------------------------------------------------------------------
        Control myNamingContainer = myCurrentRow.Controls[0].NamingContainer;

        // Display the NamingContainer.
        Label2.Text = "The NamingContainer is : " + myNamingContainer.UniqueID;
        Label2.Text += "<br />表示你按下--第幾列NamingContainer的UniqueID（並非從零算起）";
        Label2.Text += "<br />NamingContainer的型態：" + myNamingContainer.ToString();
    }


    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {  //程式完全跟上面相同！！
        GridViewRow myCurrentRow = GridView2.SelectedRow;

        // Display the UniqueID.
        Label3.Text = "The UniqueID is : <b>" + ((Control)(myCurrentRow.Controls[0])).UniqueID;
        Label3.Text += "</b><br />UniqueID。表示你按下--第幾列，第幾格GridViewRow的Controls[0]的UniqueID（並非從零算起）";
        Label3.Text += "<br />GridViewRow的Controls[0]的的型態：" + myCurrentRow.Controls[0].ToString();

        //---------------------------------------------------------------------------------
        Control myNamingContainer = myCurrentRow.Controls[0].NamingContainer;

        // Display the NamingContainer.
        Label4.Text = "The NamingContainer is : " + myNamingContainer.UniqueID;
        Label4.Text += "<br />表示你按下--第幾列NamingContainer的UniqueID（並非從零算起）";
        Label4.Text += "<br />(.Controls[0]) NamingContainer的型態：" + myNamingContainer.ToString();

        //---------------------------------------------------------------------------------
        Control myNamingContainer2 = myCurrentRow.FindControl("LinkButton1").NamingContainer;

        // Display the NamingContainer.
        Label5.Text = "The NamingContainer is : " + myNamingContainer2.UniqueID;
        Label5.Text += "<br />表示你按下--第幾列NamingContainer的UniqueID（並非從零算起）";
        Label5.Text += "<br />(.FindControl()) NamingContainer的型態：" + myNamingContainer2.ToString();
    }
}