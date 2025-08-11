<%@ Page Language="VB" %>

<% 
' 註解：遞減的 For迴圈
    Dim I, my_sum As Integer
             my_sum = 0

For I = 100 to 1 STEP -1
        my_sum = my_sum + I
        Response.Write(I & "<br />")
Next

    Response.Write("從1累加到100；<hr />計算1+2+3+4+....+99+100，答案是--- ")
    Response.Write(my_sum)
    
%>