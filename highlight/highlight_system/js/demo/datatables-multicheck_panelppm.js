function start_datatable_multi_check() {


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

    // 分析圖表  單片PPM表格
    // Array holding selected row IDs
    var rows_ppm_selected = [];
    var mult_check_dt = $('#datatable_single_ppm').DataTable({
        searching: false,
        //ordering: false,
        //paging: false,
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
        'order': [[$('#datatable_single_ppm th').length - 1, 'desc']],
        'rowCallback': function (row, data, dataIndex) {
            // Get row ID
            var rowId = data[0];

            // If row ID is in the list of selected row IDs
            if ($.inArray(rowId, rows_ppm_selected) !== -1) {
                $(row).find('input[type="checkbox"]').prop('checked', true);
                $(row).addClass('selected');
            }
        }
    });

    // Handle click on checkbox
    $('#datatable_single_ppm tbody').on('click', 'input[type="checkbox"]', function (e) {
        //console.log("click event");
        var $row = $(this).closest('tr');
        //console.log($row);

        // Get row data
        var data = mult_check_dt.row($row).data();
        //console.log("data:" + data);

        // Get row ID
        var rowid = data[0];
        var rowlot = data[1];
        //console.log("rowlot: " + rowlot);

        // Determine whether row ID is in the list of selected row IDs
        var index = $.inArray(rowlot, rows_ppm_selected);
        //console.log("index: " +index);

        // If checkbox is checked and row ID is not in list of selected row IDs
        if (this.checked && index === -1) {
            rows_ppm_selected.push(rowlot);


            // Otherwise, if checkbox is not checked and row ID is in list of selected row IDs
        } else if (!this.checked && index !== -1) {
            rows_ppm_selected.splice(index, 1);

        }

        //console.log("rows_ppm_selected: " + rows_ppm_selected);

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
        updateDataTableSelectAllCtrl(mult_check_dt);

        // Prevent click event from propagating to parent
        e.stopPropagation();
    });

    // Handle click on table cells with checkboxes
    $('#datatable_single_ppm').on('click', 'tbody td, thead th:first-child', function (e) {
        $(this).parent().find('input[type="checkbox"]').trigger('click');
    });

    // Handle click on "Select all" control
    $('thead input[name="select_all"]', mult_check_dt.table().container()).on('click', function (e) {
        if (this.checked) {
            $('#datatable_single_ppm tbody input[type="checkbox"]:not(:checked)').trigger('click');
        } else {
            $('#datatable_single_ppm tbody input[type="checkbox"]:checked').trigger('click');
        }

        // Prevent click event from propagating to parent
        e.stopPropagation();
    });

    // Handle table draw event
    mult_check_dt.on('draw', function () {
        // Update state of "Select all" control
        updateDataTableSelectAllCtrl(mult_check_dt);
    });


    // Handle form submission event on "Fail by 片 ppm分析" page
    $('#singleppmForm').on('submit', function (e) {
        var form = this;
        //var lot_list = "";

        //alert(mult_check_dt.$('input[type="checkbox"]').length);
        console.log(mult_check_dt.columns().checkboxes.selected().length);
        var selectedRows = mult_check_dt.columns().checkboxes.selected()[2];
        //console.log(selectedRows);

        // Iterate over all checkboxes in the table
        mult_check_dt.$('input[type="checkbox"]').each(function (index, elem) {
            //alert(index + ": '" + this.checked + "' - '" + mult_check_dt.row(index).data()[1] + "' - '" +mult_check_dt.row(index).data()[2]);
            // If checkbox doesn't exist in DOM
            if ($.contains(document, this)) {
                //alert(index + ": '" + this.checked + "' - '" + mult_check_dt.row(index).data()[1] + "' - '" + mult_check_dt.row(index).data()[2]);
                // If checkbox is checked
                if (this.checked) {
                    //alert(index + ": '" + mult_check_dt.row(index).data()[0] + "' - '" + mult_check_dt.row(index).data()[1] + "' - '" + mult_check_dt.row(index).data()[2]);
                    //lot_list += mult_check_dt.row(index).data()[2] + ",";
                }
            }
        });
        //alert(rows_ppm_selected);
        $("input[name='panel_list']").val(rows_ppm_selected);

        $("input[name='input_site']").val($("#input_site").val());
        $("input[name='input_lot']").val($("#input_lot").val());
        $("input[name='input_defect_code']").val($("#input_defect_code").val());

        //畫面執行中circle
        //$('.spinner').css('display', 'block');
        //e.preventDefault();
    }); 


}