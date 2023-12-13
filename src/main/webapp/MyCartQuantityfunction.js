function incrementValue(event) {
    event.preventDefault();
    var fieldName = event.target.getAttribute('data-field');
    var parent = event.target.closest('div');
    var currentVal = parseInt(parent.querySelector('input[name=' + fieldName + ']').value, 10);

    if (!isNaN(currentVal)) {
        parent.querySelector('input[name=' + fieldName + ']').value = currentVal + 1;
    } else {
        parent.querySelector('input[name=' + fieldName + ']').value = 1;
    }
}

function decrementValue(event) {
    event.preventDefault();
    var fieldName = event.target.getAttribute('data-field');
    var parent = event.target.closest('div');
    var currentVal = parseInt(parent.querySelector('input[name=' + fieldName + ']').value, 10);

    if (!isNaN(currentVal) && currentVal > 1) {
        parent.querySelector('input[name=' + fieldName + ']').value = currentVal - 1;
    } else {
        parent.querySelector('input[name=' + fieldName + ']').value = 1;
    }
}