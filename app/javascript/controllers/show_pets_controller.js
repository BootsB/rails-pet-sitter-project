import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["tabContent"];
  currentIndex = 0; // Initialize the current index to the first tab

  showTab(event) {
    const index = parseInt(event.currentTarget.dataset.tabTarget);
    this.toggleTabContent(index);
  }

  toggleTabContent(index) {
    // Hide the currently active tab content
    this.tabContentTargets[this.currentIndex].classList.remove("active");

    // Show the newly selected tab content
    this.tabContentTargets[index].classList.add("active");

    // Update the current index
    this.currentIndex = index;
  }
}
