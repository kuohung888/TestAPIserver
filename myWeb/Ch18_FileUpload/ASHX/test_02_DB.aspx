<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_02_DB.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_ASHX_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />

                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="test_02_DB.ashx?id={0}" 
                    
                    HeaderText="超連結欄位(HyperLinkField)" Text="利用.ashx(泛型處理常式)來呈現" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [title], [author] FROM [test]"></asp:SqlDataSource>
    
        <br />
        <br />
        <br />
        <a href="http://msdn.microsoft.com/zh-tw/library/bb398986(v=vs.90).aspx">http://msdn.microsoft.com/zh-tw/library/bb398986(v=vs.90).aspx</a><br />
        <h4 class="subHeading" style="color: rgb(0, 0, 0); font-size: 1.077em; font-family: 'Segoe UI Semibold', 'Segoe UI', 'Lucida Grande', Verdana, Arial, Helvetica, sans-serif; font-weight: normal; margin: 0px; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;">ASP.NET 中的內建 HTTP 處理常式</h4>
        <div class="subsection" style="color: rgb(0, 0, 0); font-family: 'Segoe UI', 'Lucida Grande', Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 15px; line-height: 18px;">
                ASP.NET 會根據檔案的副檔名，將 HTTP 要求對應到 HTTP 處理常式。所有 HTTP 處理常式都可處理應用程式中個別 HTTP URL 或 URL 群組的擴充功能。ASP.NET 包括數個內建的 HTTP 處理常式，如下表所列。</p>
            <div class="caption">
            </div>
            <div class="tableSection">
                <table frame="lhs" style="border-collapse: collapse; padding: 0px; width: 876px; border: 1px solid rgb(187, 187, 187);" width="50%">
                    <tr>
                        <th style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; background-color: rgb(237, 237, 237); color: rgb(112, 112, 112); text-align: left;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                處理常式</p>
                        </th>
                        <th style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; background-color: rgb(237, 237, 237); color: rgb(112, 112, 112); text-align: left;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                描述</p>
                        </th>
                    </tr>
                    <tr>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                <strong>ASP.NET 網頁處理常式 (*.aspx)</strong></p>
                        </td>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                所有 ASP.NET 網頁的預設 HTTP 處理常式。</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                <strong>Web 服務處理常式 (*.asmx)</strong></p>
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                Web Service（請看書本下集）</p>
                        </td>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                在 ASP.NET 中建立為 .asmx 檔案之 Web 服務網頁的預設 HTTP 處理常式。</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p class="auto-style1" style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                <strong>泛型 Web 處理常式 (*.ashx)</strong></p>
                        </td>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                所有不包含 UI，但包含<span class="Apple-converted-space">&nbsp;</span><a href="http://msdn.microsoft.com/zh-tw/library/ms366713(v=vs.90).aspx" style="text-decoration: none; color: rgb(3, 105, 122);">@ WebHandler</a><span class="Apple-converted-space">&nbsp;</span>指示詞之 Web 處理常式的預設 HTTP 處理常式。</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                <strong>追蹤處理常式 (trace.axd)</strong></p>
                        </td>
                        <td style="border: 1px solid rgb(187, 187, 187); margin: 10px; padding: 10px 8px; color: rgb(42, 42, 42); vertical-align: top;">
                            <p style="color: rgb(42, 42, 42); margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px; line-height: 18px;">
                                顯示目前頁面追蹤資訊的處理常式。如需詳細資訊，請參閱<span class="Apple-converted-space">&nbsp;</span><span sdata="link"><a href="http://msdn.microsoft.com/zh-tw/library/wwh16c6c(v=vs.90).aspx" style="text-decoration: none; color: rgb(3, 105, 122);">HOW TO：使用追蹤檢視器檢視 ASP.NET 追蹤資訊</a></span>。</p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    
        <br />
    
    </div>

    </form>
</body>
</html>
