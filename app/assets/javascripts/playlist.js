$(document).on('ready page:load', function () {
    $('.heart').click(function(){
        $(this).toggleClass('fill');
    });

    $('#playlist').DataTable({
        "columns": [
            {"orderable": false },
            null, null, null, null
        ],
        "order": [[ 1, "desc" ]]
    });
});

$(document).ajaxSuccess(function (event, xhr, settings ) {
    var data = JSON.parse(xhr.responseText);
    var cssClass = ".votes-count[data-id="+data.id+"]";
    $(cssClass).text(data.count);
});

