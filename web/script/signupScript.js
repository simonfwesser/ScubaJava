$(document).ready(function () {
    // https://api.jquery.com/each/ 
    // https://stackoverflow.com/questions/11921239/jquery-each-does-not-loop-through-all-elements
    
    $('.form-signup input').each(function (i, element) {
        var validity = $(this).attr("validity");
        $(this)
                .on("invalid", function () {
                    element.setCustomValidity(validity);
                })
                .on("input", function () {
                    element.setCustomValidity("");
                });
    });

});
