


console.log("JavaScript file loaded successfully");
document.getElementById('orderForm').addEventListener('submit', function (event) {
    var tableNoInput = document.getElementById("tableno");
    if (tableNoInput.value.trim() === '') {
        event.preventDefault(); // Prevent form submission
        alert('Please enter the table number.');
        tableNoInput.focus(); //document.getElementById('orderForm').addEventListener('submit', function (event) {
    }
});

var quantityControls = document.querySelectorAll('.quantity-control');

quantityControls.forEach(function (control) {
    var minusBtn = control.querySelector('.minus-btn');
    var plusBtn = control.querySelector('.plus-btn');
    var quantity = control.querySelector('.quantity');
    var number = control.closest('tr').querySelector('.number');
    var total = control.closest('tr').querySelector('.total');

    minusBtn.addEventListener('click', function () {
        var value = parseInt(quantity.textContent);
        if (value >= 1) {
            value--;
            quantity.textContent = value;
            calculateTotal(number, value, total);
            calculateOrderTotal();
        }
    });

    plusBtn.addEventListener('click', function () {
        var value = parseInt(quantity.textContent);
        value++;
        quantity.textContent = value;
        calculateTotal(number, value, total);
        calculateOrderTotal();
    });
});

function calculateTotal(numberElement, quantity, totalElement) {
    var number = parseInt(numberElement.textContent);
    var total = number * quantity;
    totalElement.textContent = total;
}

function calculateOrderTotal() {
    var totalCosts = document.querySelectorAll('.total');
    var orderTotal = 0;

    totalCosts.forEach(function (totalCost) {
        var value = parseInt(totalCost.textContent);
        if (value > 0) {
            orderTotal += value;
        }
    });

    var orderTotalElement = document.getElementById('orderTotal');
    orderTotalElement.textContent = 'Total Amount: ' + orderTotal;
}

function calculateAllTotals() {
    var rows = document.querySelectorAll('tbody tr');
    rows.forEach(function (row) {
        var number = row.querySelector('.number');
        var quantity = row.querySelector('.quantity');
        var total = row.querySelector('.total');
        var numberValue = parseInt(number.textContent);
        var quantityValue = parseInt(quantity.textContent);
        var totalValue = numberValue * quantityValue;
        total.textContent = totalValue;
    });
    calculateOrderTotal();
}

calculateAllTotals(); // Initial calculation