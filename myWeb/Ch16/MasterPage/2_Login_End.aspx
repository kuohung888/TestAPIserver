<%@ Page Title="" Language="C#" MasterPageFile="~/Book_Sample/Ch16/MasterPage/MasterPage_Session.master" AutoEventWireup="true" CodeFile="2_Login_End.aspx.cs" Inherits="Book_Sample_Ch16_MasterPage_2_Login_End" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- **** 重點在此！！ ******************************* -->
    <!--#INCLUDE FILE="defense.inc"-->
    <!-- **** 重點在此！！ ******************************* -->

    *****************************************************************<br />
    <%
                Response.Write("<br />......您好！這是改良後的程式......");
    %>
    <br />
    <br />
    *****************************************************************<br />
</asp:Content>

