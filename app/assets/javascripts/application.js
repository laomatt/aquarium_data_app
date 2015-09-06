// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require handlebars
//= require_tree .

$(document).ready(function() {
  $('body').on('submit', '#add-update', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/update/'+$(this).attr('idu'),
      type: 'POST',
      data: $(this).serialize(),
    })
    .done(function(data) {
      var context = {update: data};
      var source = $("#update-list-template").html();
      var template = Handlebars.compile(source);
      var html = template(context);
      $("#update-container").append(html)
      // debugger
    })
    $(this).trigger('reset')


  });
});