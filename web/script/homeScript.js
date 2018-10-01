$(document).ready(function () {
    $(".card").css("opacity", "0.8");
    $(".card")
            .mouseover(function () {
                $(this).css("opacity", "1");
            })
            .mouseout(function () {
                $(this).css("opacity", "0.8");
            })
            .click(function () {
                $(this.parentNode).submit();
            });
});

//onmouseover="this.style.opacity = 0.4;"
//onmouseout="this.style.opacity = 1;"
//onclick="this.parentNode.submit();"



//loadProducts();
//        // https://stackoverflow.com/questions/37269008
//        var placeholder = $('#search-input').attr('placeholder');
//        $("#search-input")
//        .attr("placeholder", placeholder)
//        .click(function () {
//        $(this).attr('placeholder', '');
//        })
//        .blur(function () {
//        $(this).attr('placeholder', placeholder);
//        })
//        ;
//        });


