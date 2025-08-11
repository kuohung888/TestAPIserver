loadJavaScriptFile("Scripts/jquery-1.4.1.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.core.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.widget.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.mouse.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.button.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.draggable.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.resizable.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.position.min.js");
loadJavaScriptFile("Scripts/UI/minified/jquery.ui.dialog.min.js");
loadJavaScriptFile("Scripts/jquery.metadata.min.js");

function loadJavaScriptFile(jspath) {
    document.write('<script type="text/javascript" src="' + jspath + '"><\/script>');
}

function InitializeDeleteConfirmation() {
    $('#deleteConfirmationDialog').dialog({
        autoOpen: false,
        resizable: false,
        height: 140,
        modal: true,
        buttons: {
            "Delete": function () {
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        }
    });
}

//*********************************************************************
//** 按下刪除按鈕以後，要把刪除的那一列 PostBack告訴 ASP.NET的後置程式碼！**
//*********************************************************************
function deleteItem(uniqueID, itemID) {
    //** 第一個參數：按鈕的ID。
    //** 第二個參數：要刪除的那一筆記錄的PK值（主索引鍵）。

    //以下是動態加入 jQuery Confirm小視窗的「標題」與「內文」
    var dialogTitle = '確定刪除「編號 = ' + itemID + '」這筆記錄？';
    //var dialogTitle = 'jQuery確定刪除';

    $("#deleteConfirmationDialog").html('<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>再次確認，是否刪除？</p>');

    $("#deleteConfirmationDialog").dialog({
        title: dialogTitle,
        buttons: {
            "Delete": function () { __doPostBack(uniqueID, ''); $(this).dialog("close"); },
            // ** 重點！！Post回去給後置程式碼。*******************************

            "Cancel": function () { $(this).dialog("close"); }
        }
    });

    $('#deleteConfirmationDialog').dialog('open');
    return false;
}

//*********************************************************************
//** 用來呈現例外狀況 與 錯誤碼！**
//*********************************************************************
function ShowError(errorMessage) {
    $(document).ready(function () {
        $("#deleteErrorDialog").text(errorMessage);
        $("#deleteErrorDialog").dialog({
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                }
            }
        });
    });
}