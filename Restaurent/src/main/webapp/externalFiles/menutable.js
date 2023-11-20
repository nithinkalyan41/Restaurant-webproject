


var allBtn = document.querySelector('input[name="all"]');
var vegBtn = document.querySelector('input[name="veg"]');
var nonVegBtn = document.querySelector('input[name="non-veg"]');
var drinksBtn = document.querySelector('input[name="drinks"]');

allBtn.addEventListener('click', function () {
    showTable('all-items');
});

vegBtn.addEventListener('click', function () {
    showTable('all-veg');
});

nonVegBtn.addEventListener('click', function () {
    showTable('all-non-veg');
});

drinksBtn.addEventListener('click', function () {
    showTable('all-drinks');
});

function showTable(tableId) {
    var allTables = document.querySelectorAll('.table');
    allTables.forEach(function (table) {
        if (table.id === tableId) {
            table.style.display = 'table';
        } else {
            table.style.display = 'none';
        }
    });
}
function increaseQuantity(element) {
    var inputField = element.parentNode.querySelector("input.quantity");
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        inputField.value = currentValue + 1;
    }
}

function decreaseQuantity(element) {
    var inputField = element.parentNode.querySelector("input.quantity");
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        if (currentValue > 0) {
            inputField.value = currentValue - 1;
        }
    }
}
