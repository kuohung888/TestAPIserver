//
// Updates "Select all" control in a data table
//
function updateDataTableSelectAllCtrl(table) {
    var $table = table.table().node();
    var $chkbox_all = $('tbody input[type="checkbox"]', $table);
    var $chkbox_checked = $('tbody input[type="checkbox"]:checked', $table);
    var chkbox_select_all = $('thead input[name="select_all"]', $table).get(0);

    // If none of the checkboxes are checked
    if ($chkbox_checked.length === 0) {
        chkbox_select_all.checked = false;
        if ('indeterminate' in chkbox_select_all) {
            chkbox_select_all.indeterminate = false;
        }

        // If all of the checkboxes are checked
    } else if ($chkbox_checked.length === $chkbox_all.length) {
        chkbox_select_all.checked = true;
        if ('indeterminate' in chkbox_select_all) {
            chkbox_select_all.indeterminate = false;
        }

        // If some of the checkboxes are checked
    } else {
        chkbox_select_all.checked = true;
        if ('indeterminate' in chkbox_select_all) {
            chkbox_select_all.indeterminate = true;
        }
    }
}

// Call the dataTables jQuery plugin
$(document).ready(function () {
    // 針對日期格式排序
    //$.fn.dataTableExt.oSort['time-date-sort-pre'] = function (value) {
    //    return Date.parse(value);
    //};
    //$.fn.dataTableExt.oSort['time-date-sort-asc'] = function (a, b) {
    //    return a - b;
    //};
    //$.fn.dataTableExt.oSort['time-date-sort-desc'] = function (a, b) {
    //    return b - a;
    //};

    // 報表頁面的表格，倒數第1列(日期時間)由新到舊排序
    var count = $('#dataTable th').length;
    $('#dataTable').DataTable({
        //columnDefs: [
        //    {
        //        type: 'time-date-sort',
        //        targets: [count - 1],
        //    }
        //],
        //searching: false,
        "processing": true,
        "order": [[count - 1, "desc"]],
        //stateSave: true, // 表格狀態儲存:更新頁面時，表格顯示頁不變
    });

    // Defect fail by 批的頁面，倒數第1列PPM由大到小排序
    var count_lotppm = $('#dataTable_lotppm th').length;
    $('#dataTable_lotppm').DataTable({
        paging: false,
        searching: false,
        "processing": true,
        "order": [[count_lotppm - 1, "desc"]],
        //stateSave: true, // 表格狀態儲存:更新頁面時，表格顯示頁不變
    });

    // 單片畫圖頁面的表格，倒數第2列(板號)由小到大排序
    var count_img = $('#dataTable_img th').length;
    $('#dataTable_img').DataTable({
        searching: false,
        //ordering: false,
        "processing": true,
        "order": [[count_img - 2, "asc"]],
        'columnDefs': [
            {
                "targets": 0, // column
                "className": "text-center"
            },
            {
                "targets": 1, // your case first column
                "className": "text-center"
            }
        ]
    });

    // 多批疊圖  批號清單表格
    // Array holding selected row IDs
    var rows_selected = [];
    var multiLot_dt = $('#dataTable_multiLot').DataTable({
        //searching: false,
        ordering: false,
        paging: false,
        info: false, // 預設為true　是否要顯示"目前有 x 筆資料"
        'columnDefs': [
            {
                'targets': 0,
                //'checkboxes': {
                //    'selectRow': true
                //},
                'render': function (data, type, full, meta) {
                    return '<input type="checkbox">';
                }
            }
        ],
        //'select': {
        //    'style': 'multi'
        //},
        'order': [[$('#dataTable_multiLot th').length-1, 'desc']],
        'rowCallback': function (row, data, dataIndex) {
            // Get row ID
            var rowId = data[0];

            // If row ID is in the list of selected row IDs
            if ($.inArray(rowId, rows_selected) !== -1) {
                $(row).find('input[type="checkbox"]').prop('checked', true);
                $(row).addClass('selected');
            }
        }
    });

    // Handle click on checkbox
    $('#dataTable_multiLot tbody').on('click', 'input[type="checkbox"]', function (e) {
        //console.log("click event");
        var $row = $(this).closest('tr');
        //console.log($row);

        // Get row data
        var data = multiLot_dt.row($row).data();
        //console.log("data:" + data);

        // Get row ID
        var rowid = data[0];
        var rowlot = data[1];
        //console.log("rowlot: " + rowlot);

        // Determine whether row ID is in the list of selected row IDs
        var index = $.inArray(rowlot, rows_selected);
        //console.log("index: " +index);

        // If checkbox is checked and row ID is not in list of selected row IDs
        if (this.checked && index === -1) {
            rows_selected.push(rowlot);


            // Otherwise, if checkbox is not checked and row ID is in list of selected row IDs
        } else if (!this.checked && index !== -1) {
            rows_selected.splice(index, 1);

        }

        //console.log("rows_selected: " + rows_selected);

        if (this.checked) {
            $row.addClass('selected');

            //$('#lot_list').val($('#lot_list').val() + rowData + ",");
        } else {
            $row.removeClass('selected');

            //if ($('#lot_list').val().includes(rowData)) {
            //    var temp = $('#lot_list').val().replace(rowData + ",", "");
            //    $('#lot_list').val(temp);
            //}
        }

        //console.log("#lot_list: " + $('#lot_list').val());

        // Update state of "Select all" control
        updateDataTableSelectAllCtrl(multiLot_dt);

        // Prevent click event from propagating to parent
        e.stopPropagation();
    });

    // Handle click on table cells with checkboxes
    $('#dataTable_multiLot').on('click', 'tbody td, thead th:first-child', function (e) {
        $(this).parent().find('input[type="checkbox"]').trigger('click');
    });

    // Handle click on "Select all" control
    $('thead input[name="select_all"]', multiLot_dt.table().container()).on('click', function (e) {
        if (this.checked) {
            $('#dataTable_multiLot tbody input[type="checkbox"]:not(:checked)').trigger('click');
        } else {
            $('#dataTable_multiLot tbody input[type="checkbox"]:checked').trigger('click');
        }

        // Prevent click event from propagating to parent
        e.stopPropagation();
    });

    // Handle table draw event
    multiLot_dt.on('draw', function () {
        // Update state of "Select all" control
        updateDataTableSelectAllCtrl(multiLot_dt);
    });


    // Handle form submission event on "多批疊圖" page
    $('#lotForm').on('submit', function (e) {
        var form = this;
        //var lot_list = "";

        //alert(multiLot_dt.$('input[type="checkbox"]').length);
        console.log(multiLot_dt.columns().checkboxes.selected().length);
        var selectedRows = multiLot_dt.columns().checkboxes.selected()[2];
        //console.log(selectedRows);

        // Iterate over all checkboxes in the table
        multiLot_dt.$('input[type="checkbox"]').each(function (index, elem) {
            //alert(index + ": '" + this.checked + "' - '" + multiLot_dt.row(index).data()[1] + "' - '" +multiLot_dt.row(index).data()[2]);
            // If checkbox doesn't exist in DOM
            if ($.contains(document, this)) {
                //alert(index + ": '" + this.checked + "' - '" + multiLot_dt.row(index).data()[1] + "' - '" + multiLot_dt.row(index).data()[2]);
                // If checkbox is checked
                if (this.checked) {
                    //alert(index + ": '" + multiLot_dt.row(index).data()[0] + "' - '" + multiLot_dt.row(index).data()[1] + "' - '" + multiLot_dt.row(index).data()[2]);
                    //lot_list += multiLot_dt.row(index).data()[2] + ",";
                }
            }
        });
        //alert(rows_selected);
        $("input[name='lot_list']").val(rows_selected);

        $("input[name='site_Select']").val($("#site_Select").val());
        $("input[name='input_DWG']").val($("#input_DWG").val());
        $("input[name='input_modelNum']").val($("#input_modelNum").val());
        $("input[name='defect_code_Select']").val($("#defect_code_Select").val());
        $("input[name='input_StartDate']").val($("#input_StartDate").val());
        $("input[name='input_EndDate']").val($("#input_EndDate").val());
        
        //畫面執行中circle
        $('.spinner').css('display', 'block');
        //e.preventDefault();
    }); 

    var count = $('#dataTable_au_pollution_detect th').length;
    $('#dataTable_au_pollution_detect').DataTable({
        'columnDefs': [
            {
                "targets": 2, // your case column
                "className": "text-center",
                "searchable": false,
                "orderable": false,
            }
        ],
        //searching: false,
        "processing": true,
        "order": [[count - 1, "desc"]],
        //stateSave: true, // 表格狀態儲存:更新頁面時，表格顯示頁不變
    });

});
