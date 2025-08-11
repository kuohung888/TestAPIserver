<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegularExpression_05_url.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_05" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            background-color: #FFFF00;
        }
        .style3
        {
            font-weight: bold;
        }
        .style4
        {
            text-align: left;
        }
    .style5
    {
        color: #009933;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #5</strong><br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/t9e807fx.aspx">http://msdn.microsoft.com/zh-tw/library/t9e807fx.aspx</a>
        <br />
        <br />
        <br />
        下列範例會搜尋輸入字串，並<strong>印出所有 href=&quot;...&quot; 值</strong>和它們<strong>在字串中的位置</strong>。 
        <br />
        <br />
        原始字串：<br />
        <strong><span class="style5">My favorite web sites include:</span><br 
            class="style5" />
        <span class="style5">&nbsp;&lt;A HREF=&quot;&quot;http://msdn2.microsoft.com&quot;&quot;&gt;MSDN Home 
        Page&lt;/A&gt;&lt;/P&gt;</span><br class="style5" />
        <span class="style5">&nbsp;&lt;A HREF=&quot;&quot;http://www.microsoft.com&quot;&quot;&gt;Microsoft Corporation 
        Home Page&lt;/A&gt;&lt;/P&gt;</span><br class="style5" />
        <span class="style5">&nbsp;&lt;A HREF=&quot;&quot;http://blogs.msdn.com/bclteam&quot;&quot;&gt;.NET Base Class 
        Library blog&lt;/A&gt;&lt;/P&gt;</span></strong><br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        規則運算式模式 <strong><span class="style2">href\s*=\s*(?:&quot;(?&lt;1&gt;[^&quot;&quot;]*)&quot;|(?&lt;1&gt;\S+))</span></strong> 
        的解譯方式如下表所示。<br />
        <br />

                <div  align="center">
            <table border="1" width="80%">
                        <tr>
                            <th>
                                <p>
                                    <span id="xn7_240bf022e685b0ee30ad9fe9e1fb5d5b" class="sentence">模式</span>
                                </p>
                            </th>
                            <th>
                                <p>
                                    <span id="xn8_67daf92c833c41c95db874e18fcb2786" class="sentence">描述</span>
                                </p>
                            </th>
                        </tr>
                        <tr>
                            <td class="style3">
                                <p>
                                    <span class="style3">href</span><b> </b>
                                </p>
                            </td>
                            <td class="style4">
                                <p>
                                    <span id="xn9_a9bf3748c4d50c86d28e69576091eedb" class="sentence">比對常值字串 &quot;href&quot;。</span>
                                    <span id="xn10_6966b384db08f0d8e48a0480a7811859" class="sentence">比對不區分大小寫。</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <p>
                                    <span class="style3">\s*</span><b> </b>
                                </p>
                            </td>
                            <td class="style4">
                                <p>
                                    <span id="xn11_7826c935fa1d4fa2c0017fb70d92aa8d" class="sentence SentenceHover">
                                    比對零個以上的空白字元。</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <p>
                                    <span class="style3">=</span><b> </b>
                                </p>
                            </td>
                            <td class="style4">
                                <p>
                                    <span id="xn12_5c1b6071b0e31438dafd7f4c2246fe2e" class="sentence">比對等號。</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <p>
                                    <span class="style3">\s*</span><b> </b>
                                </p>
                            </td>
                            <td class="style4">
                                <p>
                                    <span id="xn13_7826c935fa1d4fa2c0017fb70d92aa8d" class="sentence">比對零個以上的空白字元。</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <p>
                                    <span class="style3">(?:&quot;(?&lt;1&gt;[^&quot;&quot;]*)&quot;|(?&lt;1&gt;\S+))</span><b>
                                    </b>
                                </p>
                            </td>
                            <td class="style4">
                                <p>
                                    <span id="xn14_e9720a5b84086f758d6aba5724730e83" class="sentence">
                                    比對下列其中一項，但不將結果指派給擷取的群組：</span>
                                </p>
                                <ul>
                                    <li>
                                        <p>
                                            <span id="xn15_98bf08286912cafeef727b4d839bdaf3" class="sentence">
                                            引號，加上零個以上除引號外的其他任何字元，再加上引號。</span>
                                            <span id="xn16_1258e3edb49d736e5ee706de5fe712d5" class="sentence">名稱為 
                                            <span class="code" xmlns="http://www.w3.org/1999/xhtml">1</span> 的群組包含在這個模式中。</span>
                                        </p>
                                    </li>
                                    <li>
                                        <p>
                                            <span id="xn17_bd823ffaaedf63756279c202de84fc3f" class="sentence">一個或多個非空白字元。</span>
                                            <span id="xn18_1258e3edb49d736e5ee706de5fe712d5" class="sentence">名稱為 
                                            <span class="code" xmlns="http://www.w3.org/1999/xhtml">1</span> 的群組包含在這個模式中。</span>
                                        </p>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <p>
                                    <span class="style3">(?&lt;1&gt;[^&quot;]*)</span><b> </b>
                                </p>
                            </td>
                            <td class="style4">
                                <p>
                                    <span id="xn19_ecfb3561b459547af51dc21efbc2448b" class="sentence">
                                    將零個以上除引號外的其他任何字元指派給名稱為 <span class="code" xmlns="http://www.w3.org/1999/xhtml">1</span> 
                                    的擷取端群組。</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <p>
                                    <span class="style3">&quot;(?&lt;1&gt;\S+)</span><b> </b>
                                </p>
                            </td>
                            <td class="style4">
                                <p>
                                    <span id="xn20_19e9a0fccc1c55ac062328875e1bc8fd" class="sentence">
                                    將一個或多個非空白字元指派給名稱為 <span class="code" xmlns="http://www.w3.org/1999/xhtml">1</span> 
                                    的擷取端群組。</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>


    
    </div>
    </form>
    <p>
        搜尋結果會儲存在 <strong>Match 類別</strong>中，這個類別可用於存取搜尋所擷取的全部子字串。 
        它也會記憶正在搜尋的字串和正在使用的規則運算式，所以可以<strong>呼叫 <span class="style1">.Match.NextMatch()方法</span>，自上次搜尋結束的地方開始執行另一個搜尋。</strong>
    </p>
</body>
</html>
