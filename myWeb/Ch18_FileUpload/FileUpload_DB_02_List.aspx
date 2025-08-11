<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="FileUpload_DB_02_List.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_02_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            background-color: #FFFF00;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>上傳的檔案路徑，會存在DB裡面</b>（<span class="style2">FileUpload_DB資料表</span>）<br />
        圖片上傳之後，列在畫面上。<br />
        <br />
        (1). ListView的「樣版」需<b>動手加入 Image控制項</b>，用來展示圖片。<br />
        (2). 您可能需要修改「樣版」裡面，Image控制項的<b>「路徑」</b>。目前設定為 <span class="style3">
        Uploads/        </span>
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="FileUpload_DB_id" 
            DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                    FileUpload_DB_id:
                    <asp:Label ID="FileUpload_DB_idLabel" runat="server" Text='<%# Eval("FileUpload_DB_id") %>' />
                    <br />FileUpload_time:
                    <asp:Label ID="FileUpload_timeLabel" runat="server" Text='<%# Eval("FileUpload_time") %>' />
                    <br />上傳路徑與檔名：<br />
                    <asp:Label ID="test_idLabel" runat="server" Text='<%# "Uploads/" + Eval("FileUpload_FileName") %>' />
                    <br />
                    <br />

                    FileUpload_FileName + FileUpload_Memo:<br />
                    <asp:Image ID="Image1" runat="server" 
                                  ImageUrl='<%# "Uploads/" + Eval("FileUpload_FileName") %>'
                                  GenerateEmptyAlternateText="true" AlternateText='<%# Eval("FileUpload_Memo") %>' />

                    <br />FileUpload_User:
                    <asp:Label ID="FileUpload_UserLabel" runat="server" Text='<%# Eval("FileUpload_User") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>

            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>

            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                    FileUpload_DB_id:
                    <asp:Label ID="FileUpload_DB_idLabel" runat="server" Text='<%# Eval("FileUpload_DB_id") %>' />
                    <br />FileUpload_time:
                    <asp:Label ID="FileUpload_timeLabel" runat="server" Text='<%# Eval("FileUpload_time") %>' />
                    <br />上傳路徑與檔名：<br />
                    <asp:Label ID="test_idLabel" runat="server" Text='<%# "Uploads/" + Eval("FileUpload_FileName") %>' />
                    <br />
                    <br />

                    FileUpload_FileName + FileUpload_Memo:<br />
                    <asp:Image ID="Image1" runat="server" 
                         ImageUrl='<%# "Uploads/" + Eval("FileUpload_FileName") %>'
                        GenerateEmptyAlternateText="true" AlternateText='<%# Eval("FileUpload_Memo") %>' />
                    
                    <br />FileUpload_User:
                    <asp:Label ID="FileUpload_UserLabel" runat="server" Text='<%# Eval("FileUpload_User") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [FileUpload_DB]"></asp:SqlDataSource>
    
    </div>
    
    </form>
</body>
</html>
