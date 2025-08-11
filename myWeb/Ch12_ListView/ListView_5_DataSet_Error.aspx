<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListView_5_DataSet_Error.aspx.cs" Inherits="Book_Sample_Ch12_ListView_ListView_5_DataSet_Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>「手寫版」-- ListView控制項，Master-Detail</title>
    <style type="text/css">
        .style1
        {
            color: #0033CC;
        }
        .style2
        {
            font-size: small;
            background-color: #FFFF99;
        }
        .style3
        {
            font-weight: bold;
            color: #FF0000;
            background-color: #FFFF66;
        }
        .style4
        {
            font-weight: bold;
            color: #FFFFCC;
            font-size: large;
            background-color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <span class="style3">「手寫版」</span><span> ListView控制項，Master-Detail&nbsp;&nbsp;&nbsp;
    <span 
        class="style4">(有錯誤！按鈕必須按兩次才會動作？！)</span><br /><br />
    <span class="style2">加入選取按鈕之後，畫面有些地方會歪掉，必須自己動手整理一下HTML碼。</span><br />
    </span>
    <br /><br /><br />
    
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
        style="font-size: small" onitemcommand="ListView1_ItemCommand" 
        onselectedindexchanging="ListView1_SelectedIndexChanging">
        <AlternatingItemTemplate>
            <span style="background-color: #FF99CC;">
            <span class="style1">
             id:<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            </span>
            <br class="style1" />
            <span class="style1">test_time:
            <asp:Label ID="test_timeLabel" runat="server" 
                Text='<%# Eval("test_time","{0:yyyy/MM/dd}") %>'></asp:Label>
            </span>
            <br class="style1" />
            <span class="style1">title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
            </span>
            <br class="style1" />
            <span class="style1">summary:
            <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>'></asp:Label>
            </span>
            <br />
 
            <asp:Button ID="Button2" runat="server" Text="選取（Select）" CommandName="Select"  />
            <hr />
            </span>
        </AlternatingItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                style="font-family: Verdana, Arial, Helvetica, sans-serif;">

                <span ID="itemPlaceholder" runat="server"></span>
            </div>

        </LayoutTemplate>

        <SelectedItemTemplate>
            <span style="background-color: #66FF99; font-weight: bold;color: #004D00;">
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            test_time，日期:
            <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time") %>' />
            <br />
            class，分類:
            <asp:Label ID="classLabel" runat="server" Text='<%# Eval("class") %>' />
            <br />
            title，標題:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' Font-Size="Medium" ForeColor="Red" />
            <br />
            summary，摘要:
            <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' Font-Size="Small" ForeColor="#666666" />
            <br />
            article，文章內容:
            <asp:Label ID="articleLabel" runat="server" Text='<%# Eval("article") %>' Font-Size="Medium" />
            <br />
            author，作者:
            <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
            <br />
            hit_no，文章點閱率:
            <asp:Label ID="hit_noLabel" runat="server" Text='<%# Eval("hit_no") %>' />
            <br />
 
            <asp:Button ID="Button3" runat="server" Text="看完了，恢復到 Master狀態" CommandName="my_Detail"  /><br />                
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned. 抱歉，資料庫裡面，找不到任何一筆資料。</span>
        </EmptyDataTemplate>

        <ItemTemplate>
            id:<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            <br />
            test_time:
            <asp:Label ID="test_timeLabel" runat="server" Text='<%# Eval("test_time","{0:yyyy/MM/dd}") %>'></asp:Label>
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
            <br />
            summary:
            <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>'></asp:Label>
            <br />
 
            <asp:Button ID="Button1" runat="server" Text="Select（選取）" CommandName="Select"/>
            <hr />
        </ItemTemplate>
    </asp:ListView>

    </form>
</body>
</html>

