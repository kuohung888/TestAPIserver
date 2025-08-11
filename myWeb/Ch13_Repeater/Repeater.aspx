<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater.aspx.cs" Inherits="Ch12_ListView_Repeater" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            font-size: small;
        }
        .style2
        {
            background-color: #FF99FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <div align="center">
                    <table border="1" width="90%">
                        <tr>
                            <td class="style2"><b>&lt;%#Container.ItemIndex %&gt;</b><br />
                                流水號、「列」的索引值</td>
                            <td><b>id</b></td>
                            <td><b>Date & Time</b></td>
                            <td><b>Title</b></td>
                            <td><b>Summary</b></td>
                        </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td class="style2"><small><%# Container.ItemIndex%> </small></td>
                    <td><small><%# DataBinder.Eval(Container.DataItem, "id")%> </small></td>
                    <td><small><%# DataBinder.Eval(Container.DataItem, "test_time", "{0:d}")%> </small></td>
                    <td><b><%# DataBinder.Eval(Container.DataItem, "title")%> </b></td>
                    <td align="left"><small><%# DataBinder.Eval(Container.DataItem, "summary") %> </small></td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [test_time], [title], [summary] FROM [test]"></asp:SqlDataSource>

    </div>


    </form>

    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <span class="style1">&lt;asp:Repeater ID=&quot;Repeater1&quot; runat=&quot;server&quot; 
        DataSourceID=&quot;SqlDataSource1&quot;&gt;</span><br class="style1" />
        <strong><span style="text-decoration: underline" class="style1">&nbsp;</span></strong><span style="color: #0000cc"><strong><span
            style="text-decoration: underline"><span class="style1">&lt;HeaderTemplate&gt;</span><br
                class="style1" />
        </span></strong><span class="style1">&nbsp;&nbsp; &nbsp;&lt;table border="1" width="90%"&gt;</span><br
            class="style1" />
            <span class="style1">&nbsp;&nbsp; &nbsp;&lt;tr&gt;</span><br
                class="style1" />
            <span class="style1">&nbsp;&nbsp; &nbsp; &nbsp; &lt;td&gt;&lt;b&gt;Date &amp; Time&lt;/b&gt;&lt;/td&gt;</span><br
                class="style1" />
            <span class="style1">&nbsp; &nbsp; &lt;/tr&gt;</span><br
                class="style1" />
            <span style="text-decoration: underline" class="style1"><strong>&nbsp;&lt;/HeaderTemplate&gt;</strong></span><br
                class="style1" />
        </span>&nbsp;<br class="style1" />
        <strong><span style="background-color: #ffff00" class="style1">&nbsp;</span></strong><span style="color: #ff0000"><strong><span
            style="background-color: #ffff00" class="style1">&lt;ItemTemplate&gt;</span></strong><br
                class="style1" />
            <span class="style1">&nbsp; &nbsp;&nbsp; &lt;tr&gt;</span><br
                class="style1" />
            <span class="style1">&nbsp; &nbsp; &nbsp;&nbsp; &lt;td&gt;&lt;small&gt; &lt;%#DataBinder.Eval(Container.DataItem,
            "test_time", "{0:d}")%&gt; &lt;/small&gt;&lt;/td&gt;</span><br
                class="style1" />
            <span class="style1">&nbsp;&nbsp; &nbsp;&lt;/tr&gt;</span><br
                class="style1" />
            <strong><span style="background-color: #ffff00" class="style1">&nbsp;&lt;/ItemTemplate&gt;</span></strong><br
                class="style1" />
        </span>&nbsp;<br class="style1" />
        <span style="color: #0000cc"><strong>
            <span style="text-decoration: underline" class="style1">&nbsp;&lt;FooterTemplate&gt;</span></strong><br
                class="style1" />
            <span class="style1">&nbsp; &nbsp; &lt;/table&gt;</span><br
                class="style1" />
            <strong><span style="text-decoration: underline" class="style1">&nbsp;&lt;/FooterTemplate&gt;</span></strong><br
                class="style1" />
        </span><span class="style1">&nbsp;&lt;/asp:Repeater&gt;&nbsp;
        </span>
    </p>


</body>
</html>
