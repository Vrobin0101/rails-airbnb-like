import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["pending", "accepted", "declined", "pendingBtn", "acceptedBtn", "declinedBtn", "allBtn"]
  connect() {
  }

  displayAll() {
    this.pendingTarget.classList.remove("d-none")
    this.pendingBtnTarget.classList.remove("tab-active")
    this.acceptedTarget.classList.remove("d-none")
    this.acceptedBtnTarget.classList.remove("tab-active")
    this.declinedTarget.classList.remove("d-none")
    this.declinedBtnTarget.classList.remove("tab-active")
    event.target.classList.add("tab-active")
  }

  displayPending() {
    this.hideAccepted()
    this.hideDeclined()
    this.hideAll()
    this.pendingTarget.classList.remove("d-none")
    event.target.classList.add("tab-active")
  }

  displayAccepted() {
    this.hidePending()
    this.hideDeclined()
    this.hideAll()
    this.acceptedTarget.classList.remove("d-none")
    event.target.classList.add("tab-active")
  }

  displayDeclined() {
    this.hidePending()
    this.hideAccepted()
    this.hideAll()
    this.declinedTarget.classList.remove("d-none")
    event.target.classList.add("tab-active")
  }

  hidePending() {
    this.pendingBtnTarget.classList.remove("tab-active")
    this.pendingTarget.classList.add("d-none")
  }

  hideAccepted() {
    this.acceptedBtnTarget.classList.remove("tab-active")
    this.acceptedTarget.classList.add("d-none")
  }

  hideDeclined() {
    this.declinedBtnTarget.classList.remove("tab-active")
    this.declinedTarget.classList.add("d-none")
  }

  hideAll() {
    this.allBtnTarget.classList.remove('tab-active')
  }
}
