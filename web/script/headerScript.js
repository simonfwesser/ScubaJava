

$(document).ready(function () {
    $("#search-input")
            .attr("placeholder", 'Nom du produit')
            .click(function () {
                $(this).attr('placeholder', '');
            })
            .blur(function () {
                $(this).attr('placeholder', 'Nom du produit');
            })
            .autocomplete({
                source: getProductNames()
            });

});


function getProductNames() {
    var productNames = [];
    var products = []; //Requête JQuery-Ajax va aller chercher la collection nomDuProduit:sku sous cette forme
    products = {
        "ActionScript": 1,
        "AppleScript": 2,
        "Asp": 3,
        "BASIC": 4,
        "C": 5,
        "C++": 6,
        "Clojure": 7,
        "COBOL": 8,
        "ColdFusion": 9,
        "Erlang": 10,
        "Fortran": 11,
        "Groovy": 12,
        "Haskell": 13,
        "Java": 14,
        "JavaScript": 15,
        "Lisp": 16,
        "Perl": 17,
        "PHP": 18,
        "Python": 19,
        "Ruby": 20,
        "Scala": 21,
        "Scheme": 22
    };

    $.each(products, function (key, value) {
        productNames.push(key);

    });

    return productNames;
}






(function () {

    $("#cart").on("click", function () {
        $(".shopping-cart").fadeToggle("fast");
    });
})();


var iSearch = document.getElementById("iSearch");
var uSearch = document.getElementById("uSearch");
var request;
function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function search()
{
    request = new XMLHttpRequest();
    var requestURL = "SearchServlet?iSearch=" + iSearch.value;
    request.responseType = 'text/html';
    request.onreadystatechange = () => {
        getData()
    };
    request.open("GET", requestURL, true);
    request.send(null);
}

function getData() {
    if (request.readyState == 4 && request.status == 200) {

        if (iSearch.value === "") {
            uSearch.style.visibility = "hidden";
            clearResultSearch();
        } else {
            var resultText = request.responseText;
            // alert(resultText);
            var result = JSON.parse(resultText);
            alert(result.length);
            //alert(JSON.stringify(result));
            showResults(result);
        }
    }
}

function showResults(result)
{
    clearResultSearch();
    uSearch.style.visibility = "visible";

    for (var item in result)
    {

        var myLi = document.createElement('LI');
        myLi.innerHTML = "<a href='ProductServlet?sku=" + result[item].sku + "'>"
                + result[item].name + result[item].price + "</a>";
        uSearch.appendChild(myLi);
    }

}

function clearResultSearch() {
    while (uSearch.firstChild) {
        uSearch.removeChild(uSearch.firstChild);
    }

}
