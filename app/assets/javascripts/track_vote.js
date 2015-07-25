$(document).on('ready page:load', function () {
    console.log("Document Ready");
    $('.heart').click(function(){
        $(this).toggleClass('fill');
    });
});

$(document).ajaxSuccess(function (event, xhr, settings ) {
    var data = JSON.parse(xhr.responseText);
    var cssClass = ".votes-count[data-id="+data.id+"]";
    $(cssClass).text(data.count);
    return;
});

