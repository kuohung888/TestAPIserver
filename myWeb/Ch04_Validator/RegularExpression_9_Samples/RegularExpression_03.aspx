<%@ Page Language="C#" Culture="en-US" AutoEventWireup="true" CodeFile="RegularExpression_03.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_03" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FFFF00;
        }
        .style2
        {
            color: #000000;
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
            color: #006600;
        }
        .style6
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #3</strong><br />
        資料來源： <a href="http://msdn.microsoft.com/zh-tw/library/hs600312.aspx">
        http://msdn.microsoft.com/zh-tw/library/hs600312.aspx</a>
        <br />
        <br />
        <br />
        範例中使用 NumberFormatInfo 物件來判斷目前<strong>系統文化特性</strong>中的<strong> [貨幣值]格式</strong>。 
        然後，便會使用這項資訊來動態建構可從文字中擷取<strong>貨幣值</strong>的規則運算式。 
        對於每個符合項目，它會擷取只包含數值字串的子群組，將這個字串轉換為 Decimal 值，然後計算累計總數。<br />
        <br />
        在目前文化特性是<strong>英文 - 美國 (en-US)</strong> 的電腦上，請設定本網頁 <strong>&lt;% @ Page</strong> 
        ... <span class="style6"><strong>Culture=&quot;en-US&quot;</strong></span> ...<br />
        <br />
        這個範例會動態建置規則運算式<strong><span 
            class="style1"> </span><span class="style2">
        \$\s*[-+]?([0-9]{0,3}(,[0-9]{3})*(\.[0-9]+)?)</span></strong>。 這個規則運算式模式 可以解讀如下： 
        <div class="caption">
        </div>
        <div class="tableSection" align="center">
            <table border="1" width="80%">
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">\$</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn49_9ae1ebc4b803e9a9bf649e9bd956260a" class="sentence">
                            在輸入字串中尋找一個出現的美元符號 ($)。</span> <span id="xn50_27d32c96f3fea5f9298ced2db6e22864" 
                                class="sentence">規則運算式模式字串包含反斜線，表示要將美元符號解譯為常值，而不是規則運算式錨點 </span>
                            <span id="xn51_41028437c2bc918b54a61563209a7141" class="sentence">(只有 $ 
                            符號即表示規則運算式引擎應該嘗試在字串結尾開始比對)。為了確保不會將目前文化特性的貨幣符號誤解為規則運算式符號，這個範例會呼叫 
                            <span xmlns="http://www.w3.org/1999/xhtml">
                            <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.escape.aspx">
                            Escape</a></span> 方法來逸出字元。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">\s*</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn52_270f51383425a9b7906c97c75b096d99" class="sentence">尋找零個以上出現的空白字元。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">[-+]?</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn53_28a91a98e8d981bfd3cd6a81bfd1ff43" class="sentence">
                            尋找零個或一個出現的正號或負號。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">([0-9]{0,3}(,[0-9]{3})*(\.[0-9]+)?)</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn54_185f09865666c38b1eb62c7e85a88eda" class="sentence">
                            這個運算式周圍的外括號表示這是擷取型群組或子運算式。</span>
                            <span id="xn55_f87524df33b9debc18be7e8d3b2cad94" class="sentence">如果找到符合項目，則可以從 
                            <span xmlns="http://www.w3.org/1999/xhtml">
                            <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.match.groups.aspx">
                            Match<span xmlns="">.</span>Groups</a></span> 屬性傳回之 
                            <span xmlns="http://www.w3.org/1999/xhtml">
                            <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.groupcollection.aspx">
                            GroupCollection</a></span> 物件中的第二個 <span xmlns="http://www.w3.org/1999/xhtml">
                            <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.group.aspx">
                            Group</a></span> 物件擷取這部分相符字串的相關資訊 </span>
                            <span id="xn56_2a7d213d5f0044087c53e5b8b1e410d3" class="sentence">
                            (集合中的第一個項目表示整個符合項目)。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">[0-9]{0,3}</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn57_977a6afe481ecbe6d0d4db7fdf8f3c35" class="sentence">
                            尋找零個至三個出現的十進位數字 0 到 9。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">(,[0-9]{3})*</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn58_cce699c15bb361a596685721a7c0b9c3" class="sentence">
                            尋找零個以上出現的下列模式：群組分隔符號加三個十進位數字。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">\.</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn59_a4d6f2a7f1af69b5a4425fa08e576d15" class="sentence">尋找一個出現的小數分隔符號。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">[0-9]+</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn60_b7f2a8831c075a83d96737557e8c3c3f" class="sentence">尋找一個或多個十進位數字。</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p>
                            <span><span class="style3">(\.[0-9]+)?</span><b> </b> </span>
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn61_27160480764727de60dfcad05d4358ff" class="sentence">
                            尋找零個或一個出現的下列模式：小數分隔符號加至少一個十進位數字。</span>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        如果在輸入字串中發現上述任何一個子模式，則表示比對成功，而包含比對相關資訊的 Match 物件會加入至 MatchCollection 物件。<br />
        <br />
        <br />
        <br />
        原始字串：<strong><br />
        Office expenses on 2/13/2008:
        <br />
        <span class="style5">&nbsp;&nbsp;&nbsp; Paper (500 sheets) $3.95 </span>
        <br class="style5" />
        <span class="style5">&nbsp;&nbsp;&nbsp; Pencils (box of 10) $1.00 </span>
        <br class="style5" />
        <span class="style5">&nbsp;&nbsp;&nbsp; Pens (box of 10) $4.49 </span>
        <br class="style5" />
        <span class="style5">&nbsp;&nbsp;&nbsp; Erasers $2.19 </span>
        <br class="style5" />
        <span class="style5">&nbsp;&nbsp;&nbsp; Ink jet printer $69.95 </span>
        <br />
        Total Expenses $ 81.58 </strong><br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    
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
