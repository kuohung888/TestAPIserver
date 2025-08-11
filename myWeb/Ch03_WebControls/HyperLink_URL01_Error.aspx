<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="HyperLink_URL01_Error.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_HyperLink_URL01_Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #0000FF;
            font-weight: bold;
        }
        .style3
        {
            font-weight: bold;
            background-color: #FF9999;
        }
        .style4
        {
            font-weight: bold;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                                把 HyperLink控制項<span class="style1">「獨自拉進」Page</span>裡面，只會出錯！<span 
                                    class="style3">請注意看本範例的錯誤訊息！重要！</span><br />
                                <br />
                                如果搭配<span class="style2">大型控制項的「樣板」</span>，變化就會出現了！（例如：GridView與 Repeater）<br />
                                <br />
                                <br />
                                重點屬性 -- NavigateUrl=<span class="style3">&#39;</span><span class="style4">&lt;%# </span>
                                &quot;Default_Disp.aspx?id=&quot; + Eval(&quot;id&quot;)<span class="style4">%&gt;</span><span 
                                    class="style3">&#39;</span><br />
                                <br />
                                <br />
    
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "Default_Disp.aspx?id=" + Eval("id")%>' 
                                            Target="_blank"><b><big><%#Eval("title")%> </big></b></asp:HyperLink>
    <br /><br />

    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
        SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        重點，如何改進才會成功呢？<br />
        <br />
        資料來源： <a href="http://www.allenkuo.com/EBook5/view.aspx?a=1&amp;TreeNodeID=150&amp;id=1366">http://www.allenkuo.com/EBook5/view.aspx?a=1&amp;TreeNodeID=150&amp;id=1366</a>
        <br />
        <br />
        您也可以參閱本書<strong>下集</strong>（ ASP.NET專題實務(II)--範例應用與4.0新功能，松崗出版）<br />
        有一章專門講 <strong>DataBinding與 DataBindingExpression</strong></form>
</body>
</html>

