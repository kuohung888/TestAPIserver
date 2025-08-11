<%@ Page Language="C#" AutoEventWireup="true" CodeFile="String.aspx.cs" Inherits="Book_Sample_Ch02_String" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <%            
            String strA = "ABCDEFG";
            Response.Write("字串長度 Length --" + strA.Length);   // 字串的長度，答案為7。

            strA = strA.Replace("A", "B");
            Response.Write("<br> .Replace()方法 --" + strA);  // 答案為BBCDEFG。

            //==================================================
            
            string s1 = "The quick brown fox jumps over the lazy dog";
            string s2 = "fox";
            bool b = s1.Contains(s2);   // b的答案是true。
            Response.Write("<hr> .Contains()方法 --" + b.ToString());

            int i = s1.IndexOf(s2);
            Response.Write("<br> .IndexOf()方法 --" + i.ToString());
            
            //==================================================

            String words = "This is a list of words, :with: a bit of punctuation. @中文 我愛你";
            String[] resultArray = words.Split(' ');

            Response.Write("<hr>.Split()方法 --");
            foreach (String s in resultArray)
            {
               Response.Write("<br>" + s);
            }

           //==================================================

            String strResult = words.Substring(5, 10);    //記住！電腦從零算起，5代表第六個字。
            Response.Write("<hr>.Substring()方法 --" + strResult);                 
            
             %>





    </div>
    </form>
</body>
</html>
