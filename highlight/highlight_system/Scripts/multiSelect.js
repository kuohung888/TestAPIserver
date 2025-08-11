window.onload = function() {
    //initMultiselect();
}

function initMultiselect() {
    checkboxStatusChange();

    document.addEventListener("click", function (evt) {
        var flyoutElement = document.getElementById('myMultiselect'),
            targetElement = evt.target; // clicked element

        do {
            if (targetElement == flyoutElement) {
                // This is a click inside. Do nothing, just return.
                //console.log('click inside');
                return;
            }

            // Go up the DOM
            targetElement = targetElement.parentNode;
        } while (targetElement);

        // This is a click outside.
        toggleCheckboxArea(true);
        //console.log('click outside');
    });
}

function checkboxStatusChange() {
    //var multiselect = document.getElementById("mySelectLabel");
    //var multiselectOption = multiselect.getElementsByTagName('option')[0];

    var values = [];
    var checkboxes = document.getElementById("mySelectOptions");
    var checkedCheckboxes = checkboxes.querySelectorAll('input[type=checkbox]:checked');

    for (var i = 0; i < checkedCheckboxes.length;i++) {
        var checkboxValue = checkedCheckboxes[i].getAttribute('value');
        values.push(checkboxValue);
    }

    var dropdownValue = "";
    if (values.length > 0) {
        dropdownValue = values.join(', ');
    }

    //multiselectOption.innerText = dropdownValue;
    document.getElementById("piece_input").value = dropdownValue;
}

function toggleCheckboxArea(onlyHide) {
    var checkboxes = document.getElementById("mySelectOptions");
    var displayValue = checkboxes.style.display;

    if (displayValue != "block") {
        if (onlyHide == false) {
            checkboxes.style.display = "block";
        }
    } else {
        checkboxes.style.display = "none";
    }
}