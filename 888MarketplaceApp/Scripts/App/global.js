function validateInputFieldStyles() {
    var formControls = document.querySelectorAll('.form-control');

    formControls.forEach(function (control) {
        var field = control.closest('.form-group');
        control.addEventListener('input', function () {
            if (this.value) {
                field.classList.add('field--not-empty');
            } else {
                field.classList.remove('field--not-empty');
            }
        });
        field.classList.remove('field--not-empty');
        if (control.value != '') {
            field.classList.add('field--not-empty');
        }
    });
}