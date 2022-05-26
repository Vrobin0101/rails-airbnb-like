import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log('Hello')
    let fp = flatpickr(".datepicker", {
      enableTime: true,
      minDate: new Date(),
      dateFormat: "d-m-Y H:i",
      time_24hr: true,
      shorthandCurrentMonth: true,
      "locale": {
          "firstDayOfWeek": 1
      }
    });

    fp.minuteElement.style.display = "none";
  }
}
