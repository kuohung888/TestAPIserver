<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mysqlDBAccess-1.aspx.cs" Inherits="mysqlDBAccess_1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Defect Code 查詢</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card {
            max-width: 960px;
            margin: 0 auto; /* 水平置中 */
        }

        .pagination-container td {
            text-align: center;
            padding: 10px;
        }

        .pagination-container a,
        .pagination-container span {
            display: inline-block;
            margin: 0 3px;
            padding: 6px 12px;
            color: #0d6efd;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            text-decoration: none;
        }

        .pagination-container span {
            background-color: #0d6efd;
            color: white;
            font-weight: bold;
        }

        .form-inline-group {
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="card shadow-lg border-0">
            <div class="card-header bg-primary text-white text-center">
                <h4 class="mb-0">Defect Code 部門資料查詢</h4>
            </div>
            <div class="card-body">
                <!-- 查詢區塊 -->
                <div class="form-inline-group mb-3">
                    <asp:Label ID="lblKeyword" runat="server" Text="關鍵字(輸入 Product Name 或 Defect Code)：" CssClass="form-label fw-bold"></asp:Label>
                    <asp:TextBox ID="txtKeyword" runat="server" CssClass="form-control flex-grow-1" Width="300px"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="查詢" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                </div>

                 <!-- ✅ 總筆數顯示 -->
                <div class="mb-2 text-end text-muted">
                    <asp:Label ID="lblTotalCount" runat="server" CssClass="fw-semibold"></asp:Label>
                </div>

                 <!-- 每頁筆數選單 -->
                <div class="mb-3 d-flex justify-content-between align-items-center">
                    <div>
                        <asp:Label ID="lblPageSize" runat="server" Text="每頁筆數：" CssClass="fw-bold me-2"></asp:Label>
                        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" CssClass="form-select d-inline-block w-auto"
                            OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                            <asp:ListItem Text="100" Value="100" Selected="True" />
                            <asp:ListItem Text="500" Value="500" />
                            <asp:ListItem Text="1000" Value="1000" />
                        </asp:DropDownList>
                    </div>
                    <asp:Label ID="Label1" runat="server" CssClass="text-muted"></asp:Label>
                </div>

                <!-- GridView 區塊 -->
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="True"
                        AllowPaging="True"
                        PageSize="100"
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        CssClass="table table-striped table-hover table-bordered align-middle text-center"
                        PagerStyle-CssClass="pagination-container"
                        PagerSettings-Mode="NumericFirstLast"
                        PagerSettings-PageButtonCount="10"
                        PagerSettings-Position="TopAndBottom"
                        PagerStyle-HorizontalAlign="Center">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
