import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

const _MS_PER_DAY = 1000 * 60 * 60 * 24;
const _MS_PER_HOURS = 1000 * 60 * 60;

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["start", "end", "price", "time", "offer", "offerinfos"]
  connect() {
    flatpickr(".datepicker", {
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
  total(event) {
    this.offerinfosTarget.classList.add("d-none")
    const offerPrice = parseFloat(this.offerTarget.innerText, 10)
    if (this.startTarget.value !== "" && this.endTarget.value !== "") {
      console.log('got here')
      const start = new Date(this.startTarget.value)
      const end = new Date(this.endTarget.value)
      const days = Math.round((end - start) / _MS_PER_DAY)
      const hours = Math.round((end - start) / _MS_PER_HOURS)
      if (days >= 1) {
        this.timeTarget.innerText = `${days} days `
        this.priceTarget.innerText = `${offerPrice * (10 * days)} $`
      } else {
        this.timeTarget.innerText = `${hours} hours `
        this.priceTarget.innerText = `${offerPrice * hours} $`

      }
      this.offerinfosTarget.classList.remove("d-none")
    }
  }
}
