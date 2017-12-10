$(function () {
    "use strict";

    function toggleNext() {
        var toggler = $(this);
        var togglable = toggler.next();
        var checked = toggler.find('input:checked');

        if (checked.val() === 'sim') {
            console.log(togglable);
            togglable.slideDown(200);
        } else {
            togglable.slideUp(200);
        }
    }

    var formToggler = $('.form-toggler');

    formToggler.each(toggleNext);
    formToggler.on('change', toggleNext);


});