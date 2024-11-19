import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculator"
export default class extends Controller {
  static targets = ["startElement", "endElement", "daysElement", "totalElement"]

  connect() {
    console.log("connecting...")
    console.log(this.endElementTarget);
    console.log(this.startElementTarget);
  }

  calculate() {
    this.endElementTarget - this.startElementTarget

  }
}


// create function calculate, get start and end date (end - start)
// data value,  passing values from html to Sjs
