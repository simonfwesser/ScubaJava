

$(document).ready(function () {
    loadProducts();
    // https://stackoverflow.com/questions/37269008
    var placeholder = $('#search-input').attr('placeholder');
    $("#search-input")
            .attr("placeholder", placeholder)
            .click(function () {
                $(this).attr('placeholder', '');
            })
            .blur(function () {
                $(this).attr('placeholder', placeholder);
            })
            ;

});

var productsJson;
var products;
function loadProducts() {
    $.ajax(
            {
                url: "SearchServlet",
                success: function (data) {
                    productsJson = data;
                    products = JSON.parse(productsJson);
                    $("#search-input")
                            .autocomplete({
                                //https://api.jqueryui.com/autocomplete/
                                source: getArray(products),
                                select: function (event, ui) {
                                    window.location.href = 'ProductServlet' + "?sku=" + ui.item.value;
                                }
                            });
                }
            }
    );
}

function getArray(products) {
    var productArray = [];
    $.each(products, function (key, val) {
        productArray.push({label: val.name, value: val.sku});
    });
    return productArray;
}