import { Controller } from "@hotwired/stimulus"

// Copies the source value to the clipboard
export default class extends Controller {
  static targets = ["source", "button"]

  async copy() {
    await navigator.clipboard.writeText(this.sourceTarget.value)
    const label = this.buttonTarget.textContent
    this.buttonTarget.textContent = "¡Copiado!"
    setTimeout(() => { this.buttonTarget.textContent = label }, 2000)
  }
}
