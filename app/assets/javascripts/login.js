// This is a manifest file that'll be compiled into admin.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require jquery.validate.js
//= require additional-methods.min.js
//= require turbolinks


$( document ).ready(function() {
    $('#new_user').validate({
        rules: {
            'user[email]': {
                required: true,
                email: true
            },
            'user[password]': {
                required: true,
                pwcheck: true,
                minlength: 7
            }
        },
        messages: {
            'user[email]': {
                required: "enter email"
            },
            'user[password]': {
                required: "Password required",
                pwcheck: "Password should be strong!",
                minlength: "Minimum length 7"
            }
        }
        errorPlacement: function (error, element) {
            error.insertAfter($(element).parent());
        }
        
    });
    $('.datepicker').datepicker({format: 'dd/mm/yyyy'});
    $.validator.addMethod("pwcheck",
        function(value, element) {
            return /^[A-Za-z0-9\d=!\-@._*]+$/.test(value);
    });

});



