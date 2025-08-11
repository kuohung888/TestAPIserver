<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegularExpression_02.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
        }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            color: #FF0000;
        }
        .style4
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #2</strong><br />
        資料來源： <a href="http://msdn.microsoft.com/zh-tw/library/hs600312.aspx">
        http://msdn.microsoft.com/zh-tw/library/hs600312.aspx</a>
        <br />
        <br />
        <br />
        <strong>不小心輸入重複字</strong>是寫文章的人常犯的錯誤。 您可以使用規則運算式來識別重複字，如下列範例所示。 
        <br />
        <br />
        規則運算式模式<strong><span class="style4"> \b(\w+?)\s\1\b</span></strong> 可以解讀如下：<div class="caption">
        </div>
        <div class="tableSection" align="center">
            <table border="1" width="80%">
                <tr>
                    <td class="style1">
                        <p>
                            <span class="style1">\b</span><b> </b>
                        </p>
                    </td>
                    <td class="style2">
                        <p>
                            <span id="xn31_8632afc8419b5da833f21d6b5a0b5a4a" class="sentence">從字緣開始。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <p>
                            <span id="xn32_31ac5f50ee29d3b9ddb7c8baaf215523" class="style1">(\w+)</span><b>
                            </b>
                        </p>
                    </td>
                    <td class="style2">
                        <p>
                            <span id="xn33_573128a1e778a03b7d3f33c49f0800d4" class="sentence">比對一個或多個文字字元。</span>
                            <span id="xn34_bb26e5aed3fd2bab67fd2154feaeed88" class="sentence">這些字元一起形成可稱為 
                            <span class="code" xmlns="http://www.w3.org/1999/xhtml">\1</span> 的群組。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <p>
                            <span class="style1">\s</span><b> </b>
                        </p>
                    </td>
                    <td class="style2">
                        <p>
                            <span id="xn35_dfada601e111afb33919d9fff1fe8ee3" class="sentence">比對空白字元。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <p>
                            <span class="style1">\1</span><b> </b>
                        </p>
                    </td>
                    <td class="style2">
                        <p>
                            <span id="xn36_6b12d113da27a28ba8e9eb4858399c04" class="sentence">比對符合名為 
                            <span class="code" xmlns="http://www.w3.org/1999/xhtml">\1</span> 之群組的子字串。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <p>
                            <span class="style1">\b</span><b> </b>
                        </p>
                    </td>
                    <td class="style2">
                        <p>
                            <span id="xn37_ceb67efd3809b9d2776929037b31ace0" class="sentence">比對字緣。</span>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        將規則運算式選項設定為 RegexOptions<strong>.IgnoreCase </strong>來<span class="style3"><strong>呼叫 Regex.Matches() 方法</strong></span>（<a 
            href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.matches.aspx">http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.matches.aspx</a> ）。 
         
        <br />
        因此，比對作業會<strong>不區分大小寫</strong>，而範例會將子字串 &quot;This this&quot; 視為重複字。 請注意，輸入字串包含子字串 &quot;this. This&quot;。 
        不過，由於中間多了標點符號，所以不會視為重複字。 
         
        <br />
        <br />
        原始字串：<strong>This this is a nice day. What about this? This tastes good. I saw a 
        a dog.</strong><br />
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <p xmlns="http://www.w3.org/1999/xhtml">
            <span id="xn10_c895638a614b8d215002a63a548ef69c" class="sentence">
            <span xmlns="http://www.w3.org/1999/xhtml">
            <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.aspx">
            Regex</a></span> 類別的方法可讓您執行下列作業：</span>
        </p>
        <ul xmlns="http://www.w3.org/1999/xhtml">
            <li>
                <p>
                    <span id="xn11_e2bdeed96e0d254397f67d3685dd7a1e" class="sentence">呼叫 
                    <span xmlns="http://www.w3.org/1999/xhtml">.<a 
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.ismatch.aspx">IsMatch</a>()</span> 方法，以判斷輸入文字中是否存在規則運算式模式。</span>
                    <span id="xn12_3a436e0a92361d1115aae63cdacfd9d7" class="sentence">如需使用 
                    <span xmlns="http://www.w3.org/1999/xhtml">.<a 
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.ismatch.aspx">IsMatch</a>()</span> 
                    方法來驗證文字的範例，請參閱 <span xmlns="http://www.w3.org/1999/xhtml">
                    <a href="http://msdn.microsoft.com/zh-tw/library/01escwtf.aspx">HOW 
                    TO：確認字串是否為有效的電子郵件格式</a></span>。</span>
                </p>
            </li>
            <li>
                <p>
                    <span id="xn13_3939075f35bd569493ce85f449e79f31" class="sentence">呼叫 
                    <span xmlns="http://www.w3.org/1999/xhtml">.<a 
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.match.aspx">Match</a>()</span> 
                    或 <span xmlns="http://www.w3.org/1999/xhtml">.<a 
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.matches.aspx">Matches</a>()</span> 方法，以擷取符合規則運算式模式的一個或所有文字相符項目。</span>
                    <span id="xn14_8bc45b8b042a561d1e7020fbfe9c36f0" class="sentence">第一個方法會傳回 
                    <span xmlns="http://www.w3.org/1999/xhtml">
                    <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.match.aspx">
                    Match</a></span> 物件，這個物件提供相符文字的相關資訊。</span>
                    <span id="xn15_16bfe91127ac24bc4c7f2ba46843e000" class="sentence">第二個方法會傳回 
                    <span xmlns="http://www.w3.org/1999/xhtml">
                    <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.matchcollection.aspx">
                    MatchCollection</a></span> 物件，每個在剖析的文字中找到的符合項目，在這個物件中都有一個 
                    <span xmlns="http://www.w3.org/1999/xhtml">
                    <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.match.aspx">
                    Match</a></span> 物件。</span>
                </p>
            </li>
            <li>
                <p>
                    <span id="xn16_29d32f05f5a7facd44e64b34684344e2" class="sentence">呼叫 
                    <span xmlns="http://www.w3.org/1999/xhtml">.<a 
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.replace.aspx">Replace</a>()</span> 方法，以取代符合規則運算式模式的文字。</span>
                    <span id="xn17_3a012ecc0029c51bfa47c4cd7d9fb7e8" class="sentence">如需使用 
                    <span xmlns="http://www.w3.org/1999/xhtml">.<a 
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.replace.aspx">Replace</a>()</span> 方法來變更日期格式和從字串移除無效字元的範例，請參閱 
                    <span xmlns="http://www.w3.org/1999/xhtml">
                    <a href="http://msdn.microsoft.com/zh-tw/library/844skk0h.aspx">HOW 
                    TO：從字串中刪除無效的字元</a></span>和 <span xmlns="http://www.w3.org/1999/xhtml">
                    <a href="http://msdn.microsoft.com/zh-tw/library/c8e9427h.aspx">範例：變更日期格式</a></span>。</span>
                </p>
            </li>
        </ul>
    
    </div>
    </form>
</body>
</html>
