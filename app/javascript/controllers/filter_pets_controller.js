import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-pets"
export default class extends Controller {
  static targets = ["items", "form", "category"]
  send(event) {
    event.preventDefault();
    const url = "/pets";
    const options = {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
      },
    };
    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        data.forEach((pet) => {
          if (pet.category === this.categoryTarget.value)
          console.log(pet.id)
          });
        });
    };
};
