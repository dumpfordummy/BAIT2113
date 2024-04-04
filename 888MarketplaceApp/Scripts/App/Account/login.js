document.addEventListener('DOMContentLoaded', function() {
  'use strict';

    validateInputFieldStyles();

    var controlIndicators = document.querySelectorAll('.control__indicator');

    controlIndicators.forEach(function (control) {
        control.addEventListener('click', function() {
            var element = document.getElementById("bodyContent_RememberMe");
            element.checked = !element.checked;
        })
    });
});