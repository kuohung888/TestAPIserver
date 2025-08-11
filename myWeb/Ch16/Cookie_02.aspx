<%@ Page Language="C#"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cookie_02 </title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
        .style2
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <p>
        使用<span class="style1">單一Cookie</span> 的 <span class="style2">兩個「子索引鍵」</span>
    </p>
    <p>        &nbsp;    </p>
    <%
            //--註解：第一種寫法。
            Response.Cookies["userInfo"]["userName"] = "MIS2000 Lab.";
            Response.Cookies["userInfo"]["lastVisit"] = DateTime.Now.ToShortDateString();
            Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(1);

            ////--註解：第二種寫法。
            //HttpCookie aCookie = new HttpCookie("userInfo");
            //     aCookie.Values["userName"] = "Bill Gates";
            //     aCookie.Values["lastVisit"] = DateTime.Now.ToShortDateString();
            //     aCookie.Expires = DateTime.Now.AddDays(1);

            //Response.Cookies.Add(aCookie);
            //Response.Write("寫入Cookie ，完成！....後續的範例，將會到本範例完成的 Cookie");


            //===========================================
            //== 取出（讀取）Cookie

            //第一種寫法。
            Response.Write("<h3>" + Request.Cookies["userInfo"]["userName"].ToString() + "</h3>");

            //第二種寫法。
            HttpCookie bCookie = Request.Cookies["userInfo"];
            Response.Write("<h3>有幾個Value呢？？......" + bCookie.Values.Count  + "</h3>");
            Response.Write("<h3>第一個值 .Values[0]......" + bCookie.Values[0] + "</h3>");
    %>
</body>
</html>

