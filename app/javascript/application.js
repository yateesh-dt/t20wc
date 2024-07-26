// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"
document.addEventListener("turbolinks:load", initializeForm);
document.addEventListener("DOMContentLoaded", initializeForm);

function initializeForm() {
  document.addEventListener('click', (event) => {
    if (event.target.matches('.remove_fields')) {
      event.preventDefault();
      event.target.closest('.nested-fields').remove();
    }

    if (event.target.matches('.add_fields')) {
      event.preventDefault();
      let time = new Date().getTime();
      let regexp = new RegExp(event.target.dataset.id, 'g');
      let newFields = event.target.dataset.fields.replace(regexp, time);
      document.querySelector('.fields').insertAdjacentHTML('beforeend', newFields);
    }
  });
}
