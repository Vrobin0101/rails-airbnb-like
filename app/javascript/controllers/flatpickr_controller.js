import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

const _MS_PER_DAY = 1000 * 60 * 60 * 24;
const _MS_PER_HOURS = 1000 * 60 * 60;

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["start", "end", "price", "time", "offer", "offerinfos"]

  connect() {
    console.log('Hello')
    let fp = flatpickr(".datepicker", {
      enableTime: true,
      minDate: new Date(),
      time_24hr: true,
      defaultHour: 10,
      defaultMinute: 0,
      hourIncrement: 2,
      minuteIncrement: 120,
      shorthandCurrentMonth: true,
      "locale": {
          "firstDayOfWeek": 1
      }
    });
  }

  total() {
    this.offerinfosTarget.classList.add("d-none")
    const offerPrice = parseFloat(this.offerTarget.innerText, 10)
    console.log(offerPrice)
    if (this.startTarget.value !== "" && this.endTarget.value !== "") {
      const start = new Date(this.startTarget.value)
      const end = new Date(this.endTarget.value)
      console.log(start)
      console.log(end)
      const days = Math.round((end - start) / _MS_PER_DAY)
      const hours = Math.round((end - start) / _MS_PER_HOURS)
      if (days === 1) {
        this.timeTarget.innerText = `Confirm this gear for ${days} day`
        this.priceTarget.innerHTML = '<i class="fa-solid fa-euro-sign fa-lg"></i>' + ' ' + `${offerPrice * (10 * days)}`
      } else if (days > 1) {
        this.timeTarget.innerText = `Confirm this gear for ${days} days`
        this.priceTarget.innerHTML = '<i class="fa-solid fa-euro-sign fa-lg"></i>' + ' ' + `${offerPrice * (10 * days)}`
      } else {
        this.timeTarget.innerText = `Confirm this gear for ${hours} hours `
        this.priceTarget.innerHTML = '<i class="fa-solid fa-euro-sign fa-lg"></i>' + ' ' + `${offerPrice * hours}`

      }
      this.offerinfosTarget.classList.remove("d-none")
    }
  }
}
