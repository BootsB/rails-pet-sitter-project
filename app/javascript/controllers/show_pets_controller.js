import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tabContent", "tabButton"]; // Add 'tabButton' target

  currentIndex = 0; // Initialize the current index to the first tab

  showTab(event) {
    const index = parseInt(event.currentTarget.dataset.tabTarget);
    this.toggleTabContent(index);
  }

  toggleTabContent(index) {
    // Remove the 'active' class from all tab contents
    this.tabContentTargets.forEach(tab => tab.classList.remove('active'));

    // Show the newly selected tab content
    this.tabContentTargets[index].classList.add("active");

    // Remove the 'active' class from all tab buttons
    this.tabButtonTargets.forEach(btn => btn.classList.remove('active'));

    // Add the 'active' class to the clicked tab button
    event.currentTarget.classList.add('active');

    // Remove the hover effect from all buttons
    this.tabButtonTargets.forEach(btn => btn.classList.remove('hover'));
  }

}
