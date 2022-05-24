// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener('DOMContentLoaded', function() {
  console.log('bonjour')
  flatpickr('.datepicker');
})

import { initFlatpickr } from "./plugins/flatpickr";
initFlatpickr();
