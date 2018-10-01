$(document).ready(function () {
    var initialOpacity = $(".card").css("opacity");
    var initialBoxShadow = $(".card").css("box-shadow");
    var mouseoverOpacity = 1;
    var mouseoverBoxShadow = "5px 5px 5px #ffa500";

    $(".card")
            .mouseover(function () {
                $(this).css("opacity", mouseoverOpacity);
                $(this).css("box-shadow", mouseoverBoxShadow);

            })
            .mouseout(function () {
                $(this).css("opacity", initialOpacity);
                $(this).css("box-shadow", initialBoxShadow);
            })
            .click(function () {
                $(this.parentNode).submit();
            });
});