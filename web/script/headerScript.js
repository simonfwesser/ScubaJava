/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
