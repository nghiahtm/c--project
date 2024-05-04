function removeProduct(id) {
    $.post({
        url: 'https://localhost:44353/Product/RemoveOnCart',
        dataType: 'json',
        type: 'POST',
        data: {
            id: id
        },
        success: function (res) {
            if (res.success == true) {
                showSuccess(res.message);
                location.reload();
            }
            else {
                if (res.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {
                    showError(res.message);
                }
            }
        },
        error: function (xhr, status, error) {
            console.error(status + ': ' + error);
        }
    });
}
function removeFavorite(id) {
    $.post({
        url: 'https://localhost:44353/Product/RemoveOnFavorite',
        dataType: 'json',
        type: 'POST',
        data: {
            id: id
        },
        success: function (res) {
            if (res.success == true) {
                showSuccess(res.message);
                location.reload();
            }
            else {
                if (res.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {
                    showError(res.message);
                }
            }
        },
        error: function (xhr, status, error) {
            console.error(status + ': ' + error);
        }
    });
}
function updateCart() {
    var lstProduct = document.getElementById("StrProduct").value;
    console.log(lstProduct);
    fetch("https://localhost:44353/Product/UpdateCart", {
        method: "POST",
        body: JSON.stringify({ lstProduct: lstProduct }),
        headers: {
            "Content-Type": "application/json; charset=UTF-8"
        }

    })
        .then(response => response.json())
        .then(data => {
            if (data.success == true) {
                showSuccess(data.message);
            }
            else {
                if (data.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {
                    showError(data.message);
                }
            }

        })
        .catch(error => {
            console.error('Error:', error);
        });
}
function placeOrder() {
    var paymentMethod = $("#paymentMethod").val();
    $.post({
        url: 'https://localhost:44353/Product/OrderSuccess',
        dataType: 'json',
        type: 'POST',
        data: {
            paymentMethod: paymentMethod
        },
        success: function (res) {
            if (res.success == true) {
                var id = res.idOrder;
                window.location = "https://localhost:44353/Product/ViewOrderSuccess?id=" + id;
            }
            else {
                if (res.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {

                }
            }
        },
        error: function (xhr, status, error) {
            console.error(status + ': ' + error);
        }
    });

}
function addShop(id) {
    $.post({
        url: 'https://localhost:44353/Product/AddShop',
        dataType: 'json',
        type: 'POST',
        data: {
            id: id
        },
        success: function (res) {
            if (res.success == true) {
                showSuccess(res.message);
                $("#cartQty").text(res.qty);
            }
            else {
                if (res.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {
                    showError(res.message);
                }
            }
        },
        error: function (xhr, status, error) {
            console.error(status + ': ' + error);
        }
    });
}
function addFavorites(id) {
    $.post({
        url: 'https://localhost:44353/Product/AddFavorite',
        dataType: 'json',
        type: 'POST',
        data: {
            id: id
        },
        success: function (res) {
            debugger;
            if (res.success == true) {
                showSuccess(res.message);
                $("#favorQty").text(res.qtyFavor);
            }
            else {
                if (res.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {
                    showError(res.message);
                }
            }
        },
        error: function (xhr, status, error) {
            console.error(status + ': ' + error);
        }
    });
}
function addShop(id) {
    $.post({
        url: 'https://localhost:44353/Product/AddShop',
        dataType: 'json',
        type: 'POST',
        data: {
            id: id
        },
        success: function (res) {
            if (res.success == true) {
                showSuccess(res.message);
                $("#cartQty").text(res.qty);
            }
            else {
                if (res.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {
                    showError(res.message);
                }
            }
        },
        error: function (xhr, status, error) {
            console.error(status + ': ' + error);
        }
    });
}

function addFavorites(id) {
    $.post({
        url: 'https://localhost:44353/Product/AddFavorite',
        dataType: 'json',
        type: 'POST',
        data: {
            id: id
        },
        success: function (res) {
            if (res.success == true) {
                showSuccess(res.message);
                $("#favorQty").text(res.qtyFavor);
            }
            else {
                if (res.message == "Yêu cầu đăng nhập") {
                    window.location = "https://localhost:44353/User/Login";
                }
                else {
                    showError(res.message);
                }
            }
        },
        error: function (xhr, status, error) {
            console.error(status + ': ' + error);
        }
    });
}
function showSuccess(message) {
    var messageBox = document.getElementById('messageBox');
    messageBox.innerHTML = message;
    messageBox.className = 'message-box success';
    messageBox.style.display = 'block';
    setTimeout(function () {
        messageBox.style.display = 'none';
    }, 3000); // 3 seconds
}

function showError(message) {
    var messageBox = document.getElementById('messageBox');
    messageBox.innerHTML = message;
    messageBox.className = 'message-box error';
    messageBox.style.display = 'block';
    setTimeout(function () {
        messageBox.style.display = 'none';
    }, 3000); // 3 seconds
}