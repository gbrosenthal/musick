$(document).ajaxSuccess(function (event, xhr, settings ) {
    var data = JSON.parse(xhr.responseText);
    var cssClass = ".votes-count[data-id="+data.id+"]";
    $(cssClass).text(data.count);
    return;
});

