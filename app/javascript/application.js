// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// alert("Inside 'application.js' file");

$(document).ready(function() {
  // alert("Inside 'document.ready()' handler");
  $(".dropdown-trigger").dropdown();
  $('.sidenav').sidenav();
  $('#fade-out-target').fadeOut(4000);  // add 'data: {turbo: false}' to the view's form tag to make this work
});
