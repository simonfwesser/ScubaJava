

$(document).ready(function () {
    loadProducts();
    $("#search-input")
            .attr("placeholder", 'Nom du produit')
            .click(function () {
                $(this).attr('placeholder', '');
            })
            .blur(function () {
                $(this).attr('placeholder', 'Nom du produit');
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