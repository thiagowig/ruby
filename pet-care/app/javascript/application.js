// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "semantic-ui"

$(document).ready(function() {
    $(".ui.toggle.button").click(function() {
        $(".mobile.only.grid .ui.vertical.menu").toggle(100);
    });
});
