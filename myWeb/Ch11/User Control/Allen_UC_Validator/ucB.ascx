<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucB.ascx.cs" Inherits="ucB" %>
<%@ Register src="ucA.ascx" tagname="ucA" tagprefix="uc1" %>

<p>
    **************************************************<br />
	我是uc B,在這裡面插入uc A,但希望它可以 "非必填"（設定uc A 的 IsRequired="false"）</p>

    <uc1:ucA ID="ucA1" runat="server" IsRequired="false" />
<br />**************************************************<br />

