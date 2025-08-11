<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accordion_MouserHover_ADOnet.aspx.cs" Inherits="Book_Sample_jQuery_UI_Accordion_MouserHover_ADOnet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>手風琴折疊</title>
    <link rel="stylesheet" href="jQuery_JS_CSS/jquery-ui.css" />
    <script src="jQuery_JS_CSS/jquery-1.9.1.js"></script>
    <script src="jQuery_JS_CSS/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#accordion").accordion({
                event: "click hoverintent"
                //滑鼠經過「標題」，就會打開與關閉。
            });
        });

        /*
           * hoverIntent | Copyright 2011 Brian Cherne
           * http://cherne.net/brian/resources/jquery.hoverIntent.html
           * modified by the jQuery UI team
           */
        $.event.special.hoverintent = {
            setup: function () {
                $(this).bind("mouseover", jQuery.event.special.hoverintent.handler);
            },
            teardown: function () {
                $(this).unbind("mouseover", jQuery.event.special.hoverintent.handler);
            },
            handler: function (event) {
                var currentX, currentY, timeout,
                  args = arguments,
                  target = $(event.target),
                  previousX = event.pageX,
                  previousY = event.pageY;

                function track(event) {
                    currentX = event.pageX;
                    currentY = event.pageY;
                };

                function clear() {
                    target
                      .unbind("mousemove", track)
                      .unbind("mouseout", clear);
                    clearTimeout(timeout);
                }

                function handler() {
                    var prop,
                      orig = event;

                    if ((Math.abs(previousX - currentX) +
                        Math.abs(previousY - currentY)) < 7) {
                        clear();

                        event = $.Event("hoverintent");
                        for (prop in orig) {
                            if (!(prop in event)) {
                                event[prop] = orig[prop];
                            }
                        }
                        // Prevent accessing the original event since the new event
                        // is fired asynchronously and the old event is no longer
                        // usable (#6028)
                        delete event.originalEvent;

                        target.trigger(event);
                    } else {
                        previousX = currentX;
                        previousY = currentY;
                        timeout = setTimeout(handler, 100);
                    }
                }

                timeout = setTimeout(handler, 100);
                target.bind({
                    mousemove: track,
                    mouseout: clear
                });
            }
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            資料來源 <a href="http://jqueryui.com/accordion/#hoverintent">http://jqueryui.com/accordion/#hoverintent</a><br />
            <br />
            滑鼠經過「標題」，就會打開與關閉。不需按下滑鼠。<br />
            <br />

            <div id="accordion">
                <h3>Section 1--科技</h3>
                <div>
                    <p>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                            DataKeyNames="id" DataSourceID="SqlDataSource2" EnableViewState="False">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                            SelectCommand="SELECT top 5 [id], [test_time], [class], [title] FROM [test] WHERE [Class] = '科技'"></asp:SqlDataSource>
                    </p>
                </div>


                <h3>Section 2--其他</h3>
                <div>
                    <p>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                            DataKeyNames="id" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical" EnableViewState="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                            SelectCommand="SELECT top 5 [id], [test_time], [class], [title] FROM [test] WHERE [Class] = '其他'"></asp:SqlDataSource>
                    </p>
                </div>


                <h3>Section 3--教育</h3>
                <div>
                    <p>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                            DataKeyNames="id" DataSourceID="SqlDataSource1" EnableViewState="False">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                            SelectCommand="SELECT top 5 [id], [test_time], [class], [title] FROM [test] WHERE [Class] = '教育'"></asp:SqlDataSource>
                    </p>
                </div>

            </div>



        </div>
    </form>
</body>
</html>
