import { Controller } from "@hotwired/stimulus"

function countClassOccurrences(htmlData, className) {
  const classRegex = new RegExp(`\\b${className}\\b`, 'g');
  const matches = htmlData.match(classRegex);
  return matches ? matches.length : 0;
}

// Connects to data-controller="filter-pets"
export default class extends Controller {
  static targets = ["items", "form", "category", "startDate", "endDate", "city", "petAmount"]
  send(event) {
    event.preventDefault();
    const url = `/pets/?category=${this.categoryTarget.value}&start_date=${this.startDateTarget.value}&end_date=${this.endDateTarget.value}&city=${this.cityTarget.value}`;
    const options = {
      method: 'GET',
      headers: {
        'Accept': 'text/plain',
      },
    };

    fetch(url, options)
      .then(response => response.text())
      .then((data) => {
        this.itemsTarget.innerHTML = data;
        const className = "card-img-top";
        const count = countClassOccurrences(data, className);
        if (count == 1) {
          this.petAmountTarget.innerHTML = `You matched with <strong>${count}</strong> pet ♥️:`
        } else if (count > 1) {
          this.petAmountTarget.innerHTML = `You matched with <strong>${count}</strong> pets ♥️:`
        } else {
          this.petAmountTarget.innerHTML = "No pets fit your match 💔"
        }
      });
    };
};
