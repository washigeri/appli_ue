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
});