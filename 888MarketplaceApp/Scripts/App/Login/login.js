document.addEventListener('DOMContentLoaded', function() {
  'use strict';

  var formControls = document.querySelectorAll('.form-control');

  formControls.forEach(function(control) {
    control.addEventListener('input', function() {
      var field = this.closest('.form-group');
      if (this.value) {
        field.classList.add('field--not-empty');
      } else {
        field.classList.remove('field--not-empty');
      }
    });
  });

    var controlIndicators = document.querySelectorAll('.control__indicator');

    controlIndicators.forEach(function (control) {
        control.addEventListener('click', function() {
            var element = document.getElementById("body_RememberMe");
            element.checked = !element.checked;
        })
    });
});