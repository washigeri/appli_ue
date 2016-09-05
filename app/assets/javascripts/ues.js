//= require bootstrap-slider


$(document).on('turbolinks:load', function() {
    if ($('body').hasClass('ues index')) {
        $("#filtre_ects").slider({
            id: "filtre_ects",
            min: min,
            max: max,
            range: true,
            value: init_filter,
            tooltip_split: true,
            tooltip: 'always',
            tooltip_position: 'bottom'
        });
    }

    var modules = $('.nested-fields');
    modules.each(function (i) {
        var link = $(this).find('a').filter(':first');
        var collapse = $(this).find('.panel-collapse').filter(':first');
        link.attr('href', "#collapse_"+(i+1));
        collapse.attr('id', "collapse_"+(i+1));
        link.html('Module '+ (i+1));
    })

    $('#cours')
        .on('cocoon:before-insert', function (e, cour_inserted) {
            cour_inserted.fadeIn('slow');
        })
        .on('cocoon:after-insert', function (e, cour_inserted) {
            var count = $('.nested-fields').length;
            var link = $(this).find('.panel-title a').filter(':last');
            var collapse = $(this).find('.panel-collapse').filter(':last');
            link.attr('href', "#collapse_"+(count));
            collapse.attr('id', "collapse_"+(count));
            link.html('Module '+ (count));
        })
        
        .on('cocoon:before-remove', function (e, cour_removed) {
            $(this).data('remove-timeout', 1000);
            cour_removed.fadeOut('slow');
            
        })

});