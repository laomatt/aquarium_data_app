jQuery(document).ready(function($) {
  $('body').on('submit', '.enter-new-tank', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/tank/create',
      type: 'POST',
      data: $(this).serialize(),
    })
    .done(function(data) {
    var context = data;
    var source = $("#tank-list-template").html();
    var template = Handlebars.compile(source);
    var html = template(context);
    $("#tank-container").append(html);
    $('.enter-new-tank').trigger('reset');
    })
  });
});