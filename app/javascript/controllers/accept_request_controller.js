import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept-request"
export default class extends Controller {
  static targets = ["button", "reply", "replySecond"]

  message(event) {
    event.preventDefault();
    this.buttonTargets.forEach((button) => {
      button.classList.add("d-none");
    });
    this.replyTarget.innerHTML = "Booking accepted 🎉! The pet sitter's details will be sent to your email.";
  }
}
