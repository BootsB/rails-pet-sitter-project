import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  static targets = ["toggleableElement"]

  showTab() {
      this.toggleableElementTarget.classList.toggle("tab-content")
    };
}
