<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegularExpression_08_Email.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_08_Email" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            background-color: #FFFF00;
        }
        .topicContainer table{width:100%}table{border-style:solid;border-width:1px;border-color:#bbb;border-collapse:collapse}.topicContainer table tr{vertical-align:top}.topicContainer table th{background-color:#e5e5e5;padding-right:4px;padding-left:4px;padding-bottom:4px;padding-top:4px;text-align:left;height:21px;font-family:'Segoe UI',Verdana,Arial;font-size:1.077em;color:#000;font-style:normal;font-weight:normal}table th{border-style:solid;border-width:1px;border-color:#bbb}.topicContainer table td{background-color:#fff;line-height:140%;padding-right:4px;padding-left:4px;padding-bottom:9px;margin:1px;padding-top:9px}table td{border-style:solid;border-width:1px;border-color:#bbb}.topicContainer table td p{margin-top:0;margin-bottom:0;position:relative}.SentenceHover{background-color:#ffffe1}
        .style3
        {
            font-weight: bold;
        }
        .style4
        {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #8</strong><br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/01escwtf.aspx">http://msdn.microsoft.com/zh-tw/library/01escwtf.aspx</a>
        <br />
        <br />
        <span id="xn1_f44694ff985a9497b8e1d69f6da10236" class="sentence">下列範例會確認字串<strong>是否為 
        有效的 電子郵件格式</strong>。</span><br />
        <br />
        <br />
        此範例會定義<strong> .IsValidEmail()方法</strong>，如果字串包含有效的電子郵件地址，則這個方法會傳回 true，否則會傳回 
        false，但不會採取其他任何動作。<br />
        為了確認電子郵件地址是否有效，這個方法會<strong>呼叫 Regex.IsMatch(String, String) 方法</strong>，以確認地址符合規則運算式模式。<br />
        在應用程式將電子郵件地址儲存到資料庫，或顯示在 ASP.NET 網頁中之前，您可以先使用 <strong>&nbsp;.IsValidEmail()方法</strong>篩選掉包含無效字元的電子郵件地址。 
        <br />
        請注意，<strong>.IsValidEmail()方法</strong>並不會驗證電子郵件地址的真實性。它只會判斷電子郵件地址的格式是否有效。 
        <br />
        <br />
        <br />
        <hr />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #000000"></asp:Label>
    
        <hr />
        <br />
        <br />
        <br />
        <span id="xn1_607cfa815e30aa3cf8b6bb1f7dc97574" class="sentence">規則運算式模式 <strong><span class="style2">^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$</span></strong> 
        <br />
        <br />
        <br />
        <div class="tableSection" align="center">
            <table border="1" width="80%">
                <tr>
                    <th>
                        <p>
                            <span id="xn8_240bf022e685b0ee30ad9fe9e1fb5d5b" class="sentence">模式</span></p>
                    </th>
                    <th>
                        <p>
                            <span id="xn9_67daf92c833c41c95db874e18fcb2786" class="sentence">說明</span></p>
                    </th>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            ^</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn10_f5c46e880d056b2b00c637614df704d0" class="sentence">在字串開頭開始比對。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            (?(&quot;&quot;)</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn11_be4a25bce2023d832e92ca04a3bb0d86" class="sentence">判斷第一個字元是否為引號。</span><span 
                                id="xn12_d516436df16486d48d2171ee5f5d83d3" class="sentence"><span 
                                class="code" xmlns="http://www.w3.org/1999/xhtml">(?(&quot;&quot;)</span> 是交替建構的開頭。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            ((?(&quot;&quot;)(&quot;&quot;.+?&quot;&quot;@)</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn13_ea94619a3c2610d666c9f9398f754990" class="sentence">
                            如果第一個字元是引號，則比對是否為開頭引號後面接著至少一個任何字元，之後再接著結尾引號。</span><span 
                                id="xn14_88eea8b4f1a8210eb49151f09f934b37" class="sentence">此字串應該以 @ 記號做為結束。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            |(([0-9a-zA-Z]</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn15_fee150f2e64f7be1c20171d2096f2565" class="sentence">
                            如果第一個字元不是引號，則比對任何字母字元 (從 a 到 z) 或任何數字字元 (從 0 到 9)。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            (\.(?! \.)) 
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn16_494daab58c02db2866c4ee8d5d77d3cf" class="sentence">
                            如果下一個字元是句號，則相符。</span><span id="xn17_2c31eddbaa79de609175e3dd5fc0c1ec" 
                                class="sentence">如果不是句號，則向右合樣下一個字元並繼續比對。</span><span 
                                id="xn18_ef1838ee76b68b3be2a026a0644a75e6" class="sentence"><span 
                                class="code" xmlns="http://www.w3.org/1999/xhtml">(?!\.)</span> 是零寬度的右不合樣 
                            (Negative Lookahead) 判斷提示，可防止電子郵件地址的本機部分出現兩個連續的句號。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            |[-!#\$%&amp;&#39;\*\+/=\? \^`\{\}\|~\w] 
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn19_863425cc96ce47ea0053824d1b531c45" class="sentence">
                            如果下一個字元不是句號，則比對任何文字字元或下列其中一個字元：-!#$%&#39;*+=?^`{}|~。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            ((\.(?! \.))|[-!#\$%&#39;\*\+/=\? \^`\{\}\|~\w])* 
                        </p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn20_399d1d5f0fbb4844e90e25278e617381" class="sentence">比對交替模式 
                            (句號後面接著非句號，或某個字元) 零次以上。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            @</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn21_d1fac2595767f840e96a8b6924dca775" class="sentence">比對 @ 字元。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            (?&lt;=[0-9a-zA-Z])</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn22_4514e690228c6a6887f58f79314db4a0" class="sentence">如果位於 @ 
                            字元前面的字元是 A 到 Z、a 到 z 或 0 到 9，則繼續比對。</span><span 
                                id="xn23_1958395895137b817b19c23125058fe6" class="sentence"><span 
                                class="code" xmlns="http://www.w3.org/1999/xhtml">(?&lt;=[0-9a-zA-Z])</span> 
                            建構可定義零寬度的左合樣 (Positive Lookbehind) 判斷提示。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            (?(\[)</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn24_565eda09cc2f1787dd8133b1fa2dbec0" class="sentence">檢查 @ 
                            後面的字元是否為左括號。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            (\[(\d{1,3}\.){3}\d{1,3}\])</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn25_12770121fc6cba8c14c0f5e2c1e265ec" class="sentence SentenceHover">
                            如果是左括號，則比對左括號後面是否接著 IP 位址 (四組 1 至 3 位數的數字，而每組數字均以句號隔開) 與右括號。</span></p>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <p class="style3">
                            |(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6})</p>
                    </td>
                    <td class="style4">
                        <p>
                            <span id="xn26_ab2de062a92313c158102eb9bd30bc20" class="sentence">如果 @ 
                            後面的字元不是左括號，則比對一個值為 A-Z、a-z 或 0-9 的字母字元，該字母字元後面接著零個或多個文字字元或連字號，再接著值為 A-Z、a-z 或 
                            0-9 的英數字元，最後接著句號。</span><span id="xn27_200f618edfc68827b53dc6b0a41cb4b8" 
                                class="sentence">這個模式可以重複一次或多次，而且後面應接著 2 至 6 個字母 (a-z、A-Z) 字元。</span><span 
                                id="xn28_5810d51054f91b037623871d17415ec2" class="sentence">規則運算式的這個部分是設計用來擷取網域名稱。</span></p>
                    </td>
                </tr>
            </table>
        </div>
        </span>
        <br />
    
    </div>
    </form>
</body>
</html>
