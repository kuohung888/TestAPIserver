<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MSDN_UC_Template.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_MSDN_UC_Template" %>

<%@ Register Src="MSDN_UC_Template.ascx" TagPrefix="uc1" TagName="MSDN_UC_Template" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h3>Testing Templated User Control。使用者控制項的「樣板」</h3>
        範例來源：  http://msdn.microsoft.com/zh-tw/library/36574bf6(v=vs.80).aspx <br /><hr /><br /><br />
    

<uc1:MSDN_UC_Template runat="server" ID="MSDN_UC_Template">
        
          <MessageTemplate>
                    Index: <asp:Label runat="server" ID="Label1" Text='<%# Container.Index%>' />
                    <br />
                    Message: <asp:Label runat="server" ID="Label2" Text='<%# Container.Message %>' />
                    <hr />
          </MessageTemplate>

</uc1:MSDN_UC_Template>

    </div>
    </form>
</body>
</html>
