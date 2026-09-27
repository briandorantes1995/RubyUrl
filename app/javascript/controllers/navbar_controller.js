import { Controller } from "@hotwired/stimulus"

// Toggles the mobile navigation menu
export default class extends Controller {
  static targets = ["menu", "button"]

  toggle() {
    const open = this.menuTarget.classList.toggle("hidden") === false
    this.buttonTarget.setAttribute("aria-expanded", open)
  }
}
