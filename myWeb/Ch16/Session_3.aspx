<%@ Page Language="C#"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Session_3</title>
</head>
<body>
    <%  //--註解：這段程式是 Inline Code，檔名為 Session_3.aspx。

    Session["my_test1"] = "***只有你一人與這一個瀏覽器***看得到這訊息！";
    Session["my_test2"] = 1000;
    
    ArrayList A =new ArrayList();    
    for (int i = 1; i < 4; i++)
    {   //寫入ArrayList
        A.Add(i);
    }
    Session["my_test3"] = A;  //ArrayList A的內容是1 2 3。
    
    Response.Write("<h2>****執行完畢！****</h2>  <hr /><br />");    
    //-------------------------------------------------------------------------------------------------------
    
    
    if (Session["my_test1"] != null)
    {
          Response.Write("<br /> my_test1的值----" + Session["my_test1"].ToString());
    }

    if (Session["my_test2"] != null)
    {
        Response.Write("<br /> my_test2的值----" + Session["my_test2"].ToString());
    }
    
    if (Session["my_test3"] != null)
    {
        ArrayList B = (ArrayList)Session["my_test3"];
        
        Response.Write("<br /> my_test3的值----");   //讀取ArrayList
        foreach (int item in B)
        {
            Response.Write(item);
        }
        
    }    
    %>
</body>
</html>
