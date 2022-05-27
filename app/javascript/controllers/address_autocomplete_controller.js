import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    console.log("hello");
    console.log(this.addressTarget);
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      countries: 'FR',
      types: "address,postcode,locality",
      placeholder: ' Enter your address',
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }


#setInputValue(event) {
  this.addressTarget.value = event.result["place_name"]
}

#clearInputValue() {
  this.addressTarget.value = ""
}
}

// Filter = country,region,place,postcode,locality,neighborhood,address
