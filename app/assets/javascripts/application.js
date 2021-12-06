// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui.min
//= require jquery.validate
//= require rails-ujs
//= require tether.min.js
//= require bootstrap.min.js
//= require datatables
//= require select2.min.js
//= require unifyMenu.js
//= require onoffcanvas.js
//= require moment.js
//= require slimscroll.min.js
//= require common.js
//= require popper.js
//= require activestorage
//= require dataTables.min.js
//= require users
//= require teams
//= require shifts
//= require turbolinks
//= require cocoon


  setTimeout(function(){
    $('.flash').fadeOut();
  }, 5000);

  $('[data-toggle="tooltip"]').tooltip();
  $( ".datepicker" ).datepicker({
  	dateFormat: 'dd/mm/yy',
  	beforeShow: function (input, inst) {
        setTimeout(function () {
            inst.dpDiv.css({
                top: $(".datepicker").offset().top + 35,
                left: $(".datepicker").offset().left
            });
        }, 0);
    }
	});
	$( ".datepicker1" ).datepicker({
  	dateFormat: 'dd/mm/yy',
  	beforeShow: function (input, inst) {
        setTimeout(function () {
            inst.dpDiv.css({
                top: $(".datepicker1").offset().top + 35,
                left: $(".datepicker1").offset().left
            });
        }, 0);
    }
	});
});