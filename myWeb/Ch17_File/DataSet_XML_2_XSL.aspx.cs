using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;     //本範例的重點
using System.Xml;    //本範例的重點
//----自己寫的----


public partial class Ch17_File_DataSet_XML_2_XSL : System.Web.UI.Page
{
    protected void Button1_Click(object sender, EventArgs e)
    {
        //----上面已經事先寫好 Imports System.Web.Configuration ----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        SqlDataAdapter myAdapter = new SqlDataAdapter("select id,test_time,title,author from test", Conn);

        DataSet ds = new DataSet();

        try
        {
            //Conn.Open();   //---- 不用寫，DataAdapter會自動開啟Conn

            myAdapter.Fill(ds, "test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。

            //註解：透過 FileStream來開啟一個新檔案
            FileStream fs = new FileStream("C:\\mis2000lab_test.xml", FileMode.Create);

            //註解：搭配上面的 FileStream ，需要用到XmlTextWriter。
            XmlTextWriter xtw = new XmlTextWriter(fs, System.Text.Encoding.Unicode);

            //註解： .WriteProcessingInstruction()方法，用來寫入 XML宣告。
            //  XML的表頭會出現這一行， <?xml version=”1.0” ?>
            //  預設編碼為 UTF-8
            xtw.WriteProcessingInstruction("xml", "version='1.0'");

            //***************本範例新增的重點！********************
            xtw.WriteProcessingInstruction("xml-stylesheet", "type='text/xsl' href='C:\\DataSet_XML_2.xsl'");

            //註解：寫成XML格式。
            ds.WriteXml(xtw);
            xtw.Close();

        }
        catch (Exception ex)
        {
            Response.Write("<HR/> Exception Error Message----  " + ex.ToString());
        }
        finally
        {
            //---- 不用寫，DataAdapter會自動關閉Conn
            //    Conn.Close();
            //    Conn.Dispose();
        }

        Label1.Text = "<font color=red>資料轉換成功！....請看看電腦 C:\\ 底下的 mis2000lab_test.xml檔案</font>";
    }
}
