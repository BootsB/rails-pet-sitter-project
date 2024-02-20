import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    coords: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.coordsValue.lng, this.coordsValue.lat],
      zoom: 12
    })
    this.#addMarkerToMap()
  }
  #addMarkerToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.coordsValue.lng, this.coordsValue.lat ])
      .addTo(this.map)
  }
}
