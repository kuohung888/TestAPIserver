<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MSDN_UC.ascx.cs" Inherits="MSDN_UC" %>

<p>
    資料來源 -- <a href="http://msdn.microsoft.com/zh-tw/library/26db8ysc(VS.80).aspx">
    http://msdn.microsoft.com/zh-tw/library/26db8ysc%28VS.80%29.aspx</a>
</p>
<p>
    使用者控制項會顯示其中包含數字的唯讀文字方塊，以及兩個能夠讓使用者按下的箭號Button，以遞增和遞減文字方塊中的值。 </p>
<p>
    控制項會公開可以在裝載網頁中使用的三個屬性：MinValue、MaxValue 和 CurrentValue。</p>
<p>

        <asp:TextBox ID="textNumber" runat="server" 
            ReadOnly="True" Width="32px" Enabled="False" />

        <asp:Button Font-Bold="True" ID="buttonUp" runat="server"  
            Text="^" OnClick="buttonUp_Click" />

        <asp:Button Font-Bold="True" ID="buttonDown" runat="server" 
            Text="v" OnClick="buttonDown_Click" />
    
</p>