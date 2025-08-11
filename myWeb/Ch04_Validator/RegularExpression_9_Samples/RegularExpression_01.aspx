<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegularExpression_01.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #1</strong><br />
        資料來源： <a href="http://msdn.microsoft.com/zh-tw/library/hs600312.aspx">
        http://msdn.microsoft.com/zh-tw/library/hs600312.aspx</a><br />
        <br />
        <br />
        假設郵寄清單包含的名稱有些會隨著名字或姓氏而加上稱呼 (Mr.、Mrs.、Miss 或 Ms.)。 當您從清單中產生信封標籤時，如果<span 
            class="style1"><strong>不要</strong></span>包含稱呼，您可以使用規則運算式來移除稱呼，如下列範例所示。 
        <br />
        <br />
        <strong><span class="style2">規則運算式模式 (Mr\.? |Mrs\.? |Miss |Ms\.? )</span></strong> 
        會比對出現的任何 &quot;Mr &quot;、&quot;Mr.&quot; 、&quot;Mrs &quot;、&quot;Mrs.&quot; 、&quot;Miss &quot;、&quot;Ms&quot; 或 &quot;Ms.&quot; . 呼叫 Regex.Replace 方法會<strong>將符合的字串取代為 
        String.Empty</strong>，也就是說，會從原始字串中移除符合的字串。 
        <br />
        <br />
        原始字串（陣列）：<strong>&quot;Mr. Henry Hunt&quot;, &quot;Ms. Sara Samuels&quot;, &quot;Abraham Adams&quot;, &quot;Ms. 
        Nicole Norris&quot;</strong><br />
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
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.ismatch.aspx">IsMatch</a>()</span> 
                    方法，以判斷輸入文字中是否存在規則運算式模式。</span> <span id="xn12_3a436e0a92361d1115aae63cdacfd9d7" 
                        class="sentence">如需使用 <span xmlns="http://www.w3.org/1999/xhtml">.<a 
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
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.matches.aspx">Matches</a>()</span> 
                    方法，以擷取符合規則運算式模式的一個或所有文字相符項目。</span>
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
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.replace.aspx">Replace</a>()</span> 
                    方法，以取代符合規則運算式模式的文字。</span> <span id="xn17_3a012ecc0029c51bfa47c4cd7d9fb7e8" 
                        class="sentence">如需使用 <span xmlns="http://www.w3.org/1999/xhtml">.<a 
                        href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.replace.aspx">Replace</a>()</span> 
                    方法來變更日期格式和從字串移除無效字元的範例，請參閱 <span xmlns="http://www.w3.org/1999/xhtml">
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
