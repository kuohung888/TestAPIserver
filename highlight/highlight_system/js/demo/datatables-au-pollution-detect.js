
function start_datatable_au_pollution() {
    console.log("start_datatable_au_pollution()");
   

    $('#dataTable_au_pollution_detect').on('click', 'td', function () {
        var table = $('#dataTable_au_pollution_detect').DataTable();
        // 點選的column index
        var colIndex = table.cell(this).index().column; 
        console.log(colIndex);

        // 點選的row index
        var rowIndex = table.row(this).index();
        //console.log(rowIndex);

        // 點選列的批號
        var lot = table.row(this).data()[5];
        //console.log(lot);

        // 點選列的版號
        var panel_num = table.row(this).data()[6];
        //console.log(panel_num);

        // 片狀勾選框的ID
        var panelCheckboxId = "panel-" + lot + "-" + panel_num;
        // 條狀勾選框的ID
        var stripCheckboxId = "strip-" + lot + "-" + panel_num;

        //console.log("colIndex = " + colIndex);
        if (colIndex == 0) { // 勾選片狀
            //$('#' + panelCheckboxId).prop('checked', true);
            $('#' + stripCheckboxId).prop('checked', false);

            if ($('#' + panelCheckboxId).is(':checked')) {
                table.cell(rowIndex, 8).data("panel");
            }
        } else if (colIndex == 1) {  // 勾選條狀
            $('#' + panelCheckboxId).prop('checked', false);
            //$('#' + stripCheckboxId).prop('checked', true)

            if ($('#' + stripCheckboxId).is(':checked')) {
                table.cell(rowIndex, 8).data("strip");
            };
        }
        //console.log(panelCheckboxId);
        //console.log(stripCheckboxId);


    });

    //$('#updateAIResultForm').on('submit', function (e) {

    //    var length = table.columns().checkboxes.selected().length;
    //    console.log(length);

    //}


}
