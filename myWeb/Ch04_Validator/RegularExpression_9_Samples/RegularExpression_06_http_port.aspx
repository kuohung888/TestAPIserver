<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegularExpression_06_http_port.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_06_http_port" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            background-color: #FFFF00;
        }
        .style2
        {
            font-weight: bold;
        }
        .style3
        {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #6</strong><br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/63ew9az0.aspx">http://msdn.microsoft.com/zh-tw/library/63ew9az0.aspx</a>
        <br />
        <br />
        <br />
        下列範例會從 URL 中擷取<strong> 通訊協定</strong>和<strong> 通訊埠(Port)</strong>編號。<br />
        <br />
        <br />
        <br />
        原始字串：<strong><span class="style1">http</span>://www.dotblogs.com.tw<span 
            class="style1">:8080</span>/mis2000lab/123.htm</strong><br />
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        規則運算式模式<strong><span class="style1"> ^(?</span></strong><proto><strong><span 
            class="style1">\w+)://[^/]+?(?</span></strong><port><strong><span 
            class="style1">:\d+)?/ </span></strong>可以如下表所示來解讀。<br /><br />


        <div align="center">
            <table border="1" width="80%">
                <tr>
                    <th>
                        <p>
                            <span id="xn4_240bf022e685b0ee30ad9fe9e1fb5d5b" class="sentence">模式</span>
                        </p>
                    </th>
                    <th>
                        <p>
                            <span id="xn5_67daf92c833c41c95db874e18fcb2786" class="sentence">說明</span>
                        </p>
                    </th>
                </tr>
                <tr>
                    <td class="style2">
                        <p>
                            <span class="style2">^</span><b> </b>
                        </p>
                    </td>
                    <td class="style3">
                        <p>
                            <span id="xn6_f5c46e880d056b2b00c637614df704d0" class="sentence">在字串開頭開始比對。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <p>
                            <span class="style2">(?&lt;proto&gt;\w+)</span><b> </b>
                        </p>
                    </td>
                    <td class="style3">
                        <p>
                            <span id="xn7_573128a1e778a03b7d3f33c49f0800d4" class="sentence">比對一個或多個文字字元。</span>
                            <span id="xn8_875e62f9b10e22efad69e8e6678264c9" class="sentence">將這個群組命名為 
                            <span class="code" xmlns="http://www.w3.org/1999/xhtml">proto</span>。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <p>
                            <span class="style2">://</span><b> </b>
                        </p>
                    </td>
                    <td class="style3">
                        <p>
                            <span id="xn9_08d7499e8dc458de79da9e7b037fb9b4" class="sentence">比對冒號加兩個斜線符號。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <p>
                            <span class="style2">[^/]+?</span><b> </b>
                        </p>
                    </td>
                    <td class="style3">
                        <p>
                            <span id="xn10_240be5fe6e68a485115dc69183cde4b5" class="sentence">比對一個或多個 
                            (但越少越好) 出現的任何字元 (但斜線符號除外)。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <p>
                            <span class="style2">(?&lt;port&gt;:\d+)?</span><b> </b>
                        </p>
                    </td>
                    <td class="style3">
                        <p>
                            <span id="xn11_2fb3afb636d786d803d2f240d2dd007f" class="sentence">
                            比對一個或多個出現的下列模式：冒號加一個或多個數字字元。</span>
                            <span id="xn12_95d1fd9604cdc43972b302f8b532e64d" class="sentence">將這個群組命名為 
                            <span class="code" xmlns="http://www.w3.org/1999/xhtml">port</span>。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <p>
                            <span class="style2">/</span><b> </b>
                        </p>
                    </td>
                    <td class="style3">
                        <p>
                            <span id="xn13_991d197beda65fd79a8769db4d6ac3c3" class="sentence">比對斜線符號。</span>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
    
        <br />
    
    </div>
    </form>
</body>
</html>
