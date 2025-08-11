<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Web_Keyboard_2.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Web_Keyboard_Web_Keyboard_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="2_keyboard.js"></script>

    <link rel="stylesheet" type="text/css" href="2_style.css" />
    <style type="text/css">

    .auto-style1 {
            font-size: large;
    }
        .auto-style2 {
            color: #FF0000;
        }
  </style>
</head>
<body>
    <form id="form1" runat="server">
        第二個&nbsp;&nbsp;&nbsp;&nbsp; 資料來源：<a href="http://d2o0t5hpnwv4c1.cloudfront.net/378_jqueryKeyboard/demo/index.html">http://d2o0t5hpnwv4c1.cloudfront.net/378_jqueryKeyboard/demo/index.html</a><br />
        <br />
        <strong><span class="auto-style1">網頁上出現的虛擬鍵盤</span></strong></div>
        <p>
            請把您的TextBox1，<span class="auto-style2"><strong>命名為 write</strong></span>，不然的話就需要修改 2_keyboard.js檔。
        </p>
        <p>
        </p>


        <div id="container">
            請輸入：<asp:TextBox ID="write" runat="server" TextMode="MultiLine"></asp:TextBox>


            <ul id="keyboard">
                <li class="symbol"><span class="off">`</span><span class="on">~</span></li>
                <li class="symbol"><span class="off">1</span><span class="on">!</span></li>
                <li class="symbol"><span class="off">2</span><span class="on">@</span></li>
                <li class="symbol"><span class="off">3</span><span class="on">#</span></li>
                <li class="symbol"><span class="off">4</span><span class="on">$</span></li>
                <li class="symbol"><span class="off">5</span><span class="on">%</span></li>
                <li class="symbol"><span class="off">6</span><span class="on">^</span></li>
                <li class="symbol"><span class="off">7</span><span class="on">&amp;</span></li>
                <li class="symbol"><span class="off">8</span><span class="on">*</span></li>
                <li class="symbol"><span class="off">9</span><span class="on">(</span></li>
                <li class="symbol"><span class="off">0</span><span class="on">)</span></li>
                <li class="symbol"><span class="off">-</span><span class="on">_</span></li>
                <li class="symbol"><span class="off">=</span><span class="on">+</span></li>
                <li class="delete lastitem">delete</li>
                <li class="tab">tab</li>
                <li class="letter">q</li>
                <li class="letter">w</li>
                <li class="letter">e</li>
                <li class="letter">r</li>
                <li class="letter">t</li>
                <li class="letter">y</li>
                <li class="letter">u</li>
                <li class="letter">i</li>
                <li class="letter">o</li>
                <li class="letter">p</li>
                <li class="symbol"><span class="off">[</span><span class="on">{</span></li>
                <li class="symbol"><span class="off">]</span><span class="on">}</span></li>
                <li class="symbol lastitem"><span class="off">\</span><span class="on">|</span></li>
                <li class="capslock">caps lock</li>
                <li class="letter">a</li>
                <li class="letter">s</li>
                <li class="letter">d</li>
                <li class="letter">f</li>
                <li class="letter">g</li>
                <li class="letter">h</li>
                <li class="letter">j</li>
                <li class="letter">k</li>
                <li class="letter">l</li>
                <li class="symbol"><span class="off">;</span><span class="on">:</span></li>
                <li class="symbol"><span class="off">'</span><span class="on">&quot;</span></li>
                <li class="return lastitem">return</li>
                <li class="left-shift">shift</li>
                <li class="letter">z</li>
                <li class="letter">x</li>
                <li class="letter">c</li>
                <li class="letter">v</li>
                <li class="letter">b</li>
                <li class="letter">n</li>
                <li class="letter">m</li>
                <li class="symbol"><span class="off">,</span><span class="on">&lt;</span></li>
                <li class="symbol"><span class="off">.</span><span class="on">&gt;</span></li>
                <li class="symbol"><span class="off">/</span><span class="on">?</span></li>
                <li class="right-shift lastitem">shift</li>
                <li class="space lastitem">&nbsp;</li>
            </ul>
        </div>


    </form>
    <p>
        &nbsp;
    </p>
</body>
</html>
